# Wander World

## Description
This is a Rails API that works to built a web application with React.Js. It allows users to connect with other users allowing them to know where to explore in world. Users can create and delete posts, create and selete comments, also sign up, log in, and log out. The application uses a SQLite database to store data.

## Screenshots
### Users
![Screenshot from 2023-07-10 20-45-05](https://github.com/MarsMwau/Wander-World-Front-End/assets/115712038/012a27c0-13a0-4420-b65d-5362304635ba)

### Posts
![Screenshot from 2023-07-10 20-47-25](https://github.com/MarsMwau/Wander-World-Front-End/assets/115712038/830a8483-542a-4b9e-a740-564e78011271)

### Comments
![Screenshot from 2023-07-10 20-48-42](https://github.com/MarsMwau/Wander-World-Front-End/assets/115712038/c6e575e9-e0d4-45b9-9d82-d318b82023e6)

### Likes
![Screenshot from 2023-07-10 20-49-53](https://github.com/MarsMwau/Wander-World-Front-End/assets/115712038/e606f10a-8bd2-4dc4-86a6-6e9e1028180d)

## Tables

### Users
The `users` table stores information about registered users. It has the following columns:

- `id` - an auto-incrementing integer that serves as the primary key of the table
- `username` - a string that stores the username of the user
- `email` - a string that stores the email address of the user
- `password_digest` - a string that stores the encrypted password of the user
- `created_at` - a timestamp that stores the date and time when the user was created
- `updated_at` - a timestamp that stores the date and time when the user was last updated

### Posts
The `posts` table stores information about tourist destinations. It has the following columns:

- `id` - an auto-incrementing integer that serves as the primary key of the table
- `title` - a string that stores the title of the post
- `description` - a text that stores the description of the post
- `image_url` - a string that stores the URL of the image associated with the post
- `user_id` - an integer that stores the ID of the user who created the post
- `created_at` - a timestamp that stores the date and time when the post was created
- `updated_at` - a timestamp that stores the date and time when the post was last updated

### Comments
The `comments` table stores information about comments made on posts. It has the following columns:

- `id` - an auto-incrementing integer that serves as the primary key of the table
- `content` - a text that stores the content of the comment
- `user_id` - an integer that stores the ID of the user who made the comment
- `post_id` - an integer that stores the ID of the post on which the comment was made
- `created_at` - a timestamp that stores the date and time when the comment was created
- `updated_at` - a timestamp that stores the date and time when the comment was last updated

### Likes
The `likes` table stores information about likes made on posts. It has the following columns:

- `id` - an auto-incrementing integer that serves as the primary key of the table
- `user_id` - an integer that stores the ID of the user who made the like
- `post_id` - an integer that stores the ID of the post on which the like was made
- `created_at` - a timestamp that stores the date and time when the like was created
- `updated_at` - a timestamp that stores the date and time when the like was last updated

## Technologies Used

- Ruby on Rails
- React
- SQLite

## Setting Up

To set up the project, follow these steps:

1. Clone the repository to your local machine.
2. Run `bundle install` to install the required gems.
3. Run `rails db:create` to create the database.
4. Run `rails db:migrate` to set up the database.
5. Run `rails db:seed` to seed the database with sample data.
6. Run `rails s` to start the server.
7. Navigate to `http://localhost:3000` in your web browser to view the application.

## Contributors
The following people contributed to this project:
1. Derek -https://github.com/dMuguti
2. Melchizedek -https://github.com/melmuya
3. Nathan -https://github.com/nathan-netizenn
4. William -https://github.com/willtemmy

## Front-end Repo Link
The Front-end was created using React Js
- https://github.com/MarsMwau/Wander-World-Front-End

## Contact Us
If you have any questions or suggestions, please contact us at marthamumbua16@gmail.com

## License
This project is licensed under the [MIT License].
