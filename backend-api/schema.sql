drop table if exists user;
create table user
(
    id              integer      not null primary key auto_increment,
    first_name      varchar(255) not null,
    last_name       varchar(255) not null,
    shortname       varchar(255) not null,
    email           varchar(255) not null,
    password        varchar(255) not null,
    former_name     varchar(255),
    current_company integer,
    headline        varchar(255),
    color           varchar(255),
    updated_at timestamp default current_timestamp(),
    created_at timestamp default current_timestamp()
);
alter table user add column profile_photo varchar(510);
alter table user add column cover_photo varchar(510);

drop table if exists experience;
create table experience
(
    id          integer      not null primary key auto_increment,
    title       varchar(255) not null,
    company     varchar(255) not null,
    location    varchar(255),
    start_date  date         not null,
    end_date    date,
    user_id     integer      not null,
    description text,
    updated_at  timestamp default current_timestamp(),
    created_at  timestamp default current_timestamp()
);

drop table if exists education;
create table education
(
    id             integer      not null primary key auto_increment,
    school         varchar(255) not null,
    degree         varchar(255),
    field_of_study varchar(255),
    start_year     year,
    end_year       year,
    grade          varchar(255),
    activities     text,
    description    text,
    user_id        integer      not null,
    updated_at timestamp default current_timestamp(),
    created_at timestamp default current_timestamp()
);

drop table if exists comments;
create table comments
(
    id           integer                               not null primary key auto_increment,
    author_id    integer                               not null,
    post_id      integer                               not null,
    comment_body text                                  not null,
    created_at   timestamp default current_timestamp() not null,
    updated_at   timestamp default current_timestamp() not null

);

drop table if exists posts;
create table posts
(
    id         integer                               not null primary key auto_increment,
    user_id    integer                               not null,
    post_text  text                                  not null,
    created_at timestamp default current_timestamp() not null,
    updated_at timestamp default current_timestamp() not null,
    image_link varchar(255)
);

drop table if exists likes;
create table likes
(
    id         integer                               not null primary key auto_increment,
    user_id    integer                               not null,
    post_id    integer                               not null,
    created_at timestamp default current_timestamp() not null,
    updated_at timestamp default current_timestamp() not null
);

drop table if exists event;
create table event
(
    id          integer                               not null primary key auto_increment,
    name        varchar(255)                          not null,
    user_id     integer                               not null,
    object_id   varchar(255)                          not null,
    object_type varchar(255)                          not null,
    created_at  timestamp default current_timestamp() not null,
    updated_at  timestamp default current_timestamp() not null
);

drop table if exists company;
create table company
(
    id                    integer      not null primary key auto_increment,
    company_name          varchar(255) not null,
    location              varchar(255) not null,
    overview              text,
    website               varchar(255),
    company_size          varchar(255),
    headquarters_location varchar(255),
    founded_year          varchar(255)
);

drop table if exists friends;
create table friends
(
    id          integer     not null primary key auto_increment,
    user_id     integer not null,
    is_following integer not null,
    updated_at  timestamp default current_timestamp(),
    created_at  timestamp default current_timestamp()
);

/* FK */

alter table user add constraint foreign key (current_company) references company (id);
alter table experience add constraint foreign key (user_id) references user (id);
alter table education add constraint foreign key (user_id) references user (id);
alter table comments add constraint foreign key (author_id) references user (id);
alter table comments add constraint foreign key (post_id) references posts (id);
alter table posts add constraint foreign key (user_id) references user (id);
alter table likes add constraint foreign key (user_id) references user (id);
alter table likes add constraint foreign key (post_id) references posts (id);
alter table event add constraint foreign key (user_id) references user (id);
alter table friends add constraint foreign key (user_id) references user (id);
alter table friends add constraint foreign key (is_following) references user (id)
