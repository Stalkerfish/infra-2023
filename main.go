package main

import (
	"context"
	"errors"
	"fmt"
	"os"
	"log"
	"time"

	"github.com/gofiber/fiber/v2"
	"github.com/google/uuid"
	"github.com/redis/go-redis/v9"
)

const (
	sessionDuration = time.Minute * 15
	adminUsername   = "admin"
	adminPassword   = "123456"
)

func createRoutes(app *fiber.App, redisClient *redis.Client) {
	app.Get("/", func(handler *fiber.Ctx) error {
		return handler.SendString("Hello, world!")
	})

	app.Post("/", func(handler *fiber.Ctx) error {
		username := handler.Query("username", "invalid")
		password := handler.Query("password", "invalid")

		if username != adminUsername {
			return handler.Status(fiber.StatusBadRequest).SendString("invalid user")
		}

		if password != adminPassword {
			return handler.Status(fiber.StatusBadRequest).SendString("invalid password")
		}

		session := uuid.New()

		status := redisClient.Set(context.Background(), session.String(), "admin", sessionDuration)
		if status.Err() != nil {
			log.Printf("[ERROR] - Error creating session: %s", status.Err())

			return handler.Status(fiber.StatusInternalServerError).
				SendString("error creating sessions")
		}

		message := fmt.Sprintf("the new session is: %s", session)

		return handler.Status(fiber.StatusCreated).SendString(message)
	})

	app.Get("/exist/:session", func(handler *fiber.Ctx) error {
		session := handler.Params("session", "invalid")

		_, err := redisClient.Get(context.Background(), session).Result()
		if err != nil {
			if errors.Is(err, redis.Nil) {
				return handler.Status(fiber.StatusNotFound).SendString("session does not exist")
			}

			log.Printf("[ERROR] - Error getting session: %s", err)

			return handler.Status(fiber.StatusInternalServerError).
				SendString("error getting sessions")
		}

		return handler.SendString("the session exist")
	})
}

func main() {
	app := fiber.New()


	var port string
	port = os.Getenv("PORT")

	var host string
	host = os.Getenv("HOST")

	var url string
	url = host + ":" + port

	redisClient := redis.NewClient(&redis.Options{ //nolint:exhaustruct
		Addr:     "localhost:6379",
		Password: "redis",
		DB:       0,
	})

	createRoutes(app, redisClient)

	err := app.Listen(url)
	if err != nil {
		log.Panicf("[ERROR] - Error listening on port: %s", os.Getenv("PORT"))
	}
}
