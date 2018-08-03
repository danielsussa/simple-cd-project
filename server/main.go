package main

import (

	"github.com/labstack/echo"
)

func main() {
	e := echo.New()

	e.GET("/ping",pingHandler)

	e.GET("/list",getListTodoHandler)
	e.POST("/add",addTodoHandler)

	// Static file
	sts := e.Group("")
	sts.Static("/", "web/dist")
	e.Logger.Fatal(e.Start(":8080"))
}

func getListTodoHandler(c echo.Context) error{
	return nil
}

func addTodoHandler(c echo.Context) error{
	return nil
}
func pingHandler(c echo.Context) error{
	c.JSON(200,"Pong from simple-cd!")
	return nil
}