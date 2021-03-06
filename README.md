# TODO

- [x] CRUD
- [x] MVC
- [x] Active Record
- [x] Search
- [x] Paginate
- [x] Routes
- [x] Migrate
- [x] CSV Export
- [x] Validation
- [x] Authentication

# README

SCM bulletin board with Ruby on Rails.

## Features

- CRUD
- MVC
- Active Record
- Search
- Paginate
- Routes
- Migrate
- CSV Export
- Authentication

## Requirements

- Ruby = 2.6.9
- Rails >= 6.1.3

## Tecnologies

- Ruby
- Rails
- CSS and SCSS
- JS
- Bootstrap

## Installation

Firstly, you need to install Ruby and Rails in local.

CLick [Here](https://guides.rubyonrails.org/v5.0/getting_started.html) to install Ruby and Rails.

And then check each version after installation finished.

```
ruby -v

rails --version
```

```
git clone https://github.com/HtunHtun-Myat/Bulletin_Board_SCM.git
```

```
cd Bulletin_Board_SCM
```

```
bundle install
```

```
rails db:setup
```
Install Yarn package manager to compile webpack package.

```
npm install --global yarn
```

```
rails assets:precompile
```

After everything is done, run the project:

```
$ rails server
```

Finally open http://localhost:3000/ in your browser.

## Admin User

```
'name' => 'Admin',
'email' => 'admin@gmail.com',
'password' => 'password'
```

## Installation Error

If you have the following error when run **rails db:setup** command.

![Capture](https://user-images.githubusercontent.com/72719717/149468995-254f3607-ae6a-4a48-957a-2a734e45d7fe.PNG)

Open Command Prompt and enter MYSQL server with **mysql -u root -p** and run the following command.

```
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';
```
and then restart the MYSQL server.It work!!
