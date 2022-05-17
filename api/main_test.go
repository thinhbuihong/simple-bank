package api

import (
	"os"
	"testing"
)

func TestMain(m *testing.M) {
	// gin.SetMode(gin.DebugMode)
	os.Exit(m.Run())
}
