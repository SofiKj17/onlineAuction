/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     18.05.2022 1:22:50                           */
/*==============================================================*/


drop index user_to_adress_FK;

drop index adress_PK;

drop table adress;

drop index lot_to_bet_FK;

drop index user_to_bet_FK;

drop index bet_PK;

drop table bet;

drop index category_to_subcategory_FK;

drop index category_PK;

drop table category;

drop index repliers_FK;

drop index lot_to_comments_FK;

drop index user_to_comment_FK;

drop index comment_PK;

drop table comment;

drop index lot_to_category_FK;

drop index owner_to_lot_FK;

drop index lot_PK;

drop table lot;

drop index lot_to_photo_FK;

drop index lot_to_photo2_FK;

drop index lot_to_photo_PK;

drop table lot_to_photo;

drop index photo_PK;

drop table photo;

drop index user_PK;

drop table "user";

drop index user_monitors_lot_FK;

drop index user_monitors_lot2_FK;

drop index user_monitors_lot_PK;

drop table user_monitors_lot;

drop index user_to_photo_FK;

drop index user_to_photo2_FK;

drop index user_to_photo_PK;

drop table user_to_photo;

/*==============================================================*/
/* Table: adress                                                */
/*==============================================================*/
create table adress (
   id                   INT8                 not null,
   use_id               INT8                 not null,
   country              VARCHAR(256)         not null,
   city                 VARCHAR(256)         not null,
   post_code            VARCHAR(256)         not null,
   street_name          VARCHAR(256)         not null,
   hause_number         VARCHAR(256)         not null,
   flat_number          VARCHAR(256)         not null,
   constraint PK_ADRESS primary key (id)
);

/*==============================================================*/
/* Index: adress_PK                                             */
/*==============================================================*/
create unique index adress_PK on adress (
id
);

/*==============================================================*/
/* Index: user_to_adress_FK                                     */
/*==============================================================*/
create  index user_to_adress_FK on adress (
use_id
);

/*==============================================================*/
/* Table: bet                                                   */
/*==============================================================*/
create table bet (
   id                   INT8                 not null,
   lot_id               INT8                 not null,
   user_id              INT8                 not null,
   value                MONEY                not null,
   "time"               DATE                 not null,
   constraint PK_BET primary key (id)
);

/*==============================================================*/
/* Index: bet_PK                                                */
/*==============================================================*/
create unique index bet_PK on bet (
id
);

/*==============================================================*/
/* Index: user_to_bet_FK                                        */
/*==============================================================*/
create  index user_to_bet_FK on bet (
user_id
);

/*==============================================================*/
/* Index: lot_to_bet_FK                                         */
/*==============================================================*/
create  index lot_to_bet_FK on bet (
lot_id
);

/*==============================================================*/
/* Table: category                                              */
/*==============================================================*/
create table category (
   id                   INT8                 not null,
   category_id          INT8                 null,
   name                 VARCHAR(256)         not null,
   constraint PK_CATEGORY primary key (id)
);

/*==============================================================*/
/* Index: category_PK                                           */
/*==============================================================*/
create unique index category_PK on category (
id
);

/*==============================================================*/
/* Index: category_to_subcategory_FK                            */
/*==============================================================*/
create  index category_to_subcategory_FK on category (
category_id
);

/*==============================================================*/
/* Table: comment                                               */
/*==============================================================*/
create table comment (
   id                   INT8                 not null,
   lot_id               INT8                 not null,
   user_id              INT8                 not null,
   comment_id           INT8                 null,
   text                 VARCHAR(2256)        not null,
   constraint PK_COMMENT primary key (id)
);

/*==============================================================*/
/* Index: comment_PK                                            */
/*==============================================================*/
create unique index comment_PK on comment (
id
);

/*==============================================================*/
/* Index: user_to_comment_FK                                    */
/*==============================================================*/
create  index user_to_comment_FK on comment (
user_id
);

/*==============================================================*/
/* Index: lot_to_comments_FK                                    */
/*==============================================================*/
create  index lot_to_comments_FK on comment (
lot_id
);

/*==============================================================*/
/* Index: repliers_FK                                           */
/*==============================================================*/
create  index repliers_FK on comment (
comment_id
);

/*==============================================================*/
/* Table: lot                                                   */
/*==============================================================*/
create table lot (
   id                   INT8                 not null,
   category_id          INT8                 not null,
   owner_id             INT8                 not null,
   name                 VARCHAR(256)         not null,
   description          TEXT                 null,
   start_price          MONEY                not null,
   blits_price          MONEY                null,
   start_date           DATE                 not null,
   end_date             DATE                 not null,
   status               VARCHAR(256)         not null,
   constraint PK_LOT primary key (id)
);

/*==============================================================*/
/* Index: lot_PK                                                */
/*==============================================================*/
create unique index lot_PK on lot (
id
);

/*==============================================================*/
/* Index: owner_to_lot_FK                                       */
/*==============================================================*/
create  index owner_to_lot_FK on lot (
owner_id
);

/*==============================================================*/
/* Index: lot_to_category_FK                                    */
/*==============================================================*/
create  index lot_to_category_FK on lot (
category_id
);

/*==============================================================*/
/* Table: lot_to_photo                                          */
/*==============================================================*/
create table lot_to_photo (
   photo_id             INT8                 not null,
   lot_id               INT8                 not null,
   constraint PK_LOT_TO_PHOTO primary key (photo_id, lot_id)
);

/*==============================================================*/
/* Index: lot_to_photo_PK                                       */
/*==============================================================*/
create unique index lot_to_photo_PK on lot_to_photo (
photo_id,
lot_id
);

/*==============================================================*/
/* Index: lot_to_photo2_FK                                      */
/*==============================================================*/
create  index lot_to_photo2_FK on lot_to_photo (
lot_id
);

/*==============================================================*/
/* Index: lot_to_photo_FK                                       */
/*==============================================================*/
create  index lot_to_photo_FK on lot_to_photo (
photo_id
);

/*==============================================================*/
/* Table: photo                                                 */
/*==============================================================*/
create table photo (
   id                   INT8                 not null,
   reference            VARCHAR(2256)        not null,
   reference_type       VARCHAR(256)         not null,
   constraint PK_PHOTO primary key (id)
);

/*==============================================================*/
/* Index: photo_PK                                              */
/*==============================================================*/
create unique index photo_PK on photo (
id
);

/*==============================================================*/
/* Table: "user"                                                */
/*==============================================================*/
create table "user" (
   id                   INT8                 not null,
   name                 VARCHAR(256)         not null,
   last_name            VARCHAR(256)         not null,
   phone_number         VARCHAR(12)          not null,
   email                VARCHAR(256)         not null,
   password_hash        VARCHAR(1256)        not null,
   registration_date    DATE                 not null,
   nick_name            VARCHAR(256)         null,
   constraint PK_USER primary key (id)
);

/*==============================================================*/
/* Index: user_PK                                               */
/*==============================================================*/
create unique index user_PK on "user" (
id
);

/*==============================================================*/
/* Table: user_monitors_lot                                     */
/*==============================================================*/
create table user_monitors_lot (
   lot_id               INT8                 not null,
   user_id              INT8                 not null,
   constraint PK_USER_MONITORS_LOT primary key (lot_id, user_id)
);

/*==============================================================*/
/* Index: user_monitors_lot_PK                                  */
/*==============================================================*/
create unique index user_monitors_lot_PK on user_monitors_lot (
lot_id,
user_id
);

/*==============================================================*/
/* Index: user_monitors_lot2_FK                                 */
/*==============================================================*/
create  index user_monitors_lot2_FK on user_monitors_lot (
user_id
);

/*==============================================================*/
/* Index: user_monitors_lot_FK                                  */
/*==============================================================*/
create  index user_monitors_lot_FK on user_monitors_lot (
lot_id
);

/*==============================================================*/
/* Table: user_to_photo                                         */
/*==============================================================*/
create table user_to_photo (
   photo_id             INT8                 not null,
   user_id              INT8                 not null,
   constraint PK_USER_TO_PHOTO primary key (photo_id, user_id)
);

/*==============================================================*/
/* Index: user_to_photo_PK                                      */
/*==============================================================*/
create unique index user_to_photo_PK on user_to_photo (
photo_id,
user_id
);

/*==============================================================*/
/* Index: user_to_photo2_FK                                     */
/*==============================================================*/
create  index user_to_photo2_FK on user_to_photo (
user_id
);

/*==============================================================*/
/* Index: user_to_photo_FK                                      */
/*==============================================================*/
create  index user_to_photo_FK on user_to_photo (
photo_id
);

alter table adress
   add constraint FK_ADRESS_USER_TO_A_USER foreign key (use_id)
      references "user" (id)
      on delete restrict on update restrict;

alter table bet
   add constraint FK_BET_LOT_TO_BE_LOT foreign key (lot_id)
      references lot (id)
      on delete restrict on update restrict;

alter table bet
   add constraint FK_BET_USER_TO_B_USER foreign key (user_id)
      references "user" (id)
      on delete restrict on update restrict;

alter table category
   add constraint FK_CATEGORY_CATEGORY__CATEGORY foreign key (category_id)
      references category (id)
      on delete restrict on update restrict;

alter table comment
   add constraint FK_COMMENT_LOT_TO_CO_LOT foreign key (lot_id)
      references lot (id)
      on delete restrict on update restrict;

alter table comment
   add constraint FK_COMMENT_REPLIERS_COMMENT foreign key (comment_id)
      references comment (id)
      on delete restrict on update restrict;

alter table comment
   add constraint FK_COMMENT_USER_TO_C_USER foreign key (user_id)
      references "user" (id)
      on delete restrict on update restrict;

alter table lot
   add constraint FK_LOT_LOT_TO_CA_CATEGORY foreign key (category_id)
      references category (id)
      on delete restrict on update restrict;

alter table lot
   add constraint FK_LOT_OWNER_TO__USER foreign key (owner_id)
      references "user" (id)
      on delete restrict on update restrict;

alter table lot_to_photo
   add constraint FK_LOT_TO_P_LOT_TO_PH_PHOTO foreign key (photo_id)
      references photo (id)
      on delete restrict on update restrict;

alter table lot_to_photo
   add constraint FK_LOT_TO_P_LOT_TO_PH_LOT foreign key (lot_id)
      references lot (id)
      on delete restrict on update restrict;

alter table user_monitors_lot
   add constraint FK_USER_MON_USER_MONI_LOT foreign key (lot_id)
      references lot (id)
      on delete restrict on update restrict;

alter table user_monitors_lot
   add constraint FK_USER_MON_USER_MONI_USER foreign key (user_id)
      references "user" (id)
      on delete restrict on update restrict;

alter table user_to_photo
   add constraint FK_USER_TO__USER_TO_P_PHOTO foreign key (photo_id)
      references photo (id)
      on delete restrict on update restrict;

alter table user_to_photo
   add constraint FK_USER_TO__USER_TO_P_USER foreign key (user_id)
      references "user" (id)
      on delete restrict on update restrict;

