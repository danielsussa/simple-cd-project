package main

import (
	"fmt"

	"github.com/labstack/echo"
	"golang.org/x/net/websocket"
)

func main() {
	e := echo.New()

	e.GET("/ping", pingHandler)

	e.GET("/list", getListTodoHandler)
	e.POST("/add", addTodoHandler)
	e.GET("/", hello)

	// Static file
	sts := e.Group("")
	sts.Static("/", "deploy/dist")
	e.Logger.Fatal(e.Start(":8080"))
}

func getListTodoHandler(c echo.Context) error {
	return nil
}

func addTodoHandler(c echo.Context) error {
	return nil
}
func pingHandler(c echo.Context) error {
	c.JSON(200, "Pong from simple-cd")
	return nil
}

func hello(c echo.Context) error {
	websocket.Handler(func(ws *websocket.Conn) {
		defer ws.Close()
		for {
			// Write
			err := websocket.Message.Send(ws, "Hello, Client!")
			if err != nil {
				c.Logger().Error(err)
			}

			// Read
			msg := ""
			err = websocket.Message.Receive(ws, &msg)
			if err != nil {
				c.Logger().Error(err)
			}
			fmt.Printf("%s\n", msg)
		}
	}).ServeHTTP(c.Response(), c.Request())
	return nil
}
