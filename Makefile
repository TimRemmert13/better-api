.PHONY: clean deps build deploy

build: 
	env GOOS=linux go build  -o bin/goal-create lambdas/goal/create/main.go
	env GOOS=linux go build  -o bin/goal-edit lambdas/goal/edit/main.go
	env GOOS=linux go build  -o bin/goal-get lambdas/goal/get/main.go
	env GOOS=linux go build  -o bin/goal-list lambdas/goal/list/main.go
	env GOOS=linux go build  -o bin/goal-delete lambdas/goal/delete/main.go
	env GOOS=linux go build  -o bin/user-signup lambdas/user/signup/main.go
	env GOOS=linux go build  -o bin/user-verify lambdas/user/verify/main.go
	env GOOS=linux go build  -o bin/user-login lambdas/user/login/main.go
	env GOOS=linux go build  -o bin/user-logout lambdas/user/logout/main.go
	env GOOS=linux go build  -o bin/user-delete lambdas/user/delete/main.go

deps: gomodgen
	export GO111MODULE=on
	go get ./...

clean:
	rm -rf ./bin ./vendor Gopkg.lock

deploy:
	./deploy.sh

gomodgen:
	chmod u+x gomod.sh
	./gomod.sh
