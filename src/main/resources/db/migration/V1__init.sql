create table categories
(
    id    bigserial primary key,
    title varchar(255)
);
insert into categories (title)
values ('Food');

create table products
(
    id          bigserial primary key,
    title       varchar(255),
    price       int,
    category_id bigint references categories (id)
);
insert into products (title, price, category_id)
values ('Bread', 25, 1),
       ('Milk', 80, 1),
       ('Cheese', 450, 1),
       ('Cheese1', 450, 1),
       ('Cheese2', 450, 1),
       ('Cheese3', 450, 1),
       ('Cheese4', 450, 1),
       ('Cheese5', 450, 1),
       ('Cheese6', 450, 1),
       ('Cheese7', 450, 1),
       ('Cheese8', 450, 1),
       ('Cheese9', 450, 1),
       ('Cheese10', 450, 1),
       ('Cheese11', 450, 1),
       ('Cheese12', 450, 1),
       ('Cheese13', 450, 1),
       ('Cheese14', 450, 1),
       ('Cheese15', 450, 1),
       ('Cheese16', 450, 1),
       ('Cheese17', 450, 1),
       ('Cheese18', 450, 1),
       ('Cheese19', 450, 1),
       ('Cheese20', 450, 1),
       ('Cheese21', 450, 1),
       ('Cheese22', 450, 1),
       ('Cheese23', 450, 1);

create table users
(
    id         bigserial primary key,
    username   varchar(30) not null,
    password   varchar(80) not null,
    email      varchar(50) unique,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp
);

create table roles
(
    id         bigserial primary key,
    name       varchar(50) not null,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp
);

CREATE TABLE users_roles
(
    user_id bigint not null references users (id),
    role_id bigint not null references roles (id),
    primary key (user_id, role_id)
);

insert into roles (name)
values ('ROLE_USER'),
       ('ROLE_ADMIN');

insert into users (username, password, email)
values ('user', '$2a$04$Fx/SX9.BAvtPlMyIIqqFx.hLY2Xp8nnhpzvEEVINvVpwIPbA3v/.i', 'bob_johnson@gmail.com'),
       ('admin', '$2a$04$Fx/SX9.BAvtPlMyIIqqFx.hLY2Xp8nnhpzvEEVINvVpwIPbA3v/.i', 'john_johnson@gmail.com');

insert into users_roles (user_id, role_id)
values (1, 1),
       (2, 2);