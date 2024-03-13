# state_training

## Introduction

This project is one that I'm developing in order to learn Dart language and Flutter. For my ChoirManager project, check it out (here)[https://github.com/simojjuho/ChoirManager], I need to have some kind of a GUI. At first I was thinking about TypeScript / React.js but that's not the most optimal as I will have to think about many devices, screens and operating systems. Flutter seemed the most effective one for that.

The name for this project is a bit misleading. Although I am learning state management, I also am learning using APIs and styling. Although my styling skills are not (yet) on very high level, I intend to up them during this project also.

## Project structure

I am implementing feature-first CLEAN architecture with this project. It might be a bit overkill, but I want to master this. There might be some oddities here and there, but I'm learning as I go.

So far, the project tree is as follows (only  the parts that I've done by myself):

```
├── lib
│   ├── main.dart
│   └── src
│       ├── authentication
│       │   └── domain
│       │       └── core_entities
│       │           └── authentication_msg.dart
│       ├── products
│       │   ├── controllers
│       │   │   ├── category_controller.dart
│       │   │   └── product_controller.dart
│       │   ├── domain
│       │   │   ├── core_entities
│       │   │   │   ├── category.dart
│       │   │   │   └── product.dart
│       │   │   └── DTOs
│       │   │       ├── product_create_dto.dart
│       │   │       └── product_update_dto.dart
│       │   ├── presentation
│       │   │   ├── state
│       │   │   │   ├── category_state.dart
│       │   │   │   └── product_state.dart
│       │   │   └── widgets
│       │   │       ├── product_form
│       │   │       │   ├── add_product_form.dart
│       │   │       │   └── text_field_with_padding.dart
│       │   │       ├── product_list
│       │   │       │   ├── product_list_medium.dart
│       │   │       │   └── product_list_small.dart
│       │   │       ├── product_tile.dart
│       │   │       ├── product_view.dart
│       │   │       └── visible_category_options
│       │   │           ├── choose_category_medium.dart
│       │   │           └── choose_category_small.dart
│       │   └── services
│       │       ├── category_service.dart
│       │       └── product_service.dart
│       ├── shared
│       │   ├── controllers
│       │   ├── presentation
│       │   │   └── widgets
│       │   │       ├── home
│       │   │       │   └── home_view.dart
│       │   │       ├── home_view.dart
│       │   │       ├── home_view_medium.dart
│       │   │       ├── home_view_small.dart
│       │   │       ├── info
│       │   │       └── main_loading_screen.dart
│       │   ├── services
│       │   └── states
│       │       └── main_view_state.dart
│       ├── users
│       │   └── state
│       │       ├── domain
│       │       │   ├── core_entities
│       │       │   │   └── user.dart
│       │       │   └── enums
│       │       │       └── roles.dart
│       │       └── user_state.dart
│       └── utils
│           └── http.dart
```
