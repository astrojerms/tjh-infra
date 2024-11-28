package main

import (
	"github.com/pulumi/pulumi/sdk/v3/go/pulumi"
)

func main() {
	pulumi.Run(func(ctx *pulumi.Context) error {
		// Log a message
		print("Hello, World!")

		// No resources to create in this example
		return nil
	})

}
