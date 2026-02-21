package main

import (
	"context"
	"log"
	"github.com/confluentinc/confluent-kafka-go/kafka"
)

func main() {
	c, err := kafka.NewConsumer(&kafka.ConfigMap{
		"bootstrap.servers": "localhost",
		"group.id": "fraud-group",
		"auto.offset.reset": "earliest",
	})

	if err != nil {
		log.Fatalf("Failed to create consumer: %s", err)
	}

	defer c.Close()

	c.SubscribeTopics([]string{"transactions"}, nil)

	for {
		msg, err := c.ReadMessage(-1)
		if err == nil {
			log.Printf("Message on %s: %s", msg.TopicPartition, string(msg.Value))
			// Process message
		} else {
			log.Printf("Consumer error: %v (%v)", err, msg)
		}
	}
}