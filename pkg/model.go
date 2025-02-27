package router

type Channel struct {
	password          string
	connected_devices map[string]map[string]string
}

func setPassword(password string) {
	channel.password = hashAndSalt([]byte(password))
}
func verifyPassword(password string) bool {
	hash := hashAndSalt([]byte(password))
	if hash == channel.password {
		return false
	} else {
		return true
	}
}
