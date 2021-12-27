/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2021/11/24 11:03:56                          */
/*==============================================================*/


drop table if exists Violation_record;

drop table if exists appeal_record;

drop table if exists entrustment_form;

drop table if exists evaluate;

drop table if exists user;

/*==============================================================*/
/* Table: Violation_record                                      */
/*==============================================================*/
create table Violation_record
(
   violationID          varchar(50) not null,
   userID               varchar(50),
   violationTime        datetime,
   violationReason      varchar(50),
   reputationChange     varchar(50),
   reputation           varchar(50),
   primary key (violationID)
);

/*==============================================================*/
/* Table: appeal_record                                         */
/*==============================================================*/
create table appeal_record
(
   appealID             varchar(50) not null,
   userID               varchar(50),
   entrustmentID        varchar(50),
   appealContent        varchar(50),
   primary key (appealID)
);

/*==============================================================*/
/* Table: entrustment_form                                      */
/*==============================================================*/
create table entrustment_form
(
   entrustmentID        varchar(50) not null,
   entrustmentAddress   varchar(50),
   Amount               float(50,0),
   Size                 varchar(50),
   arrvialTime          datetime,
   deliveryClerkName    varchar(50),
   deliveryClerkID      varchar(50),
   State                varchar(50),
   primary key (entrustmentID)
);

/*==============================================================*/
/* Table: evaluate                                              */
/*==============================================================*/
create table evaluate
(
   userID               varchar(50) not null,
   entrustmentID        varchar(50) not null,
   evaluate_level       varchar(50),
   primary key (userID, entrustmentID)
);

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   userID               varchar(50) not null,
   violationID          varchar(50),
   userName             varchar(50),
   userPhone            varchar(50),
   userAddress          varchar(50),
   primary key (userID)
);

alter table Violation_record add constraint FK_have2 foreign key (userID)
      references user (userID) on delete restrict on update restrict;

alter table appeal_record add constraint FK_Relationship_4 foreign key (userID)
      references user (userID) on delete restrict on update restrict;

alter table appeal_record add constraint FK_appleal foreign key (entrustmentID)
      references entrustment_form (entrustmentID) on delete restrict on update restrict;

alter table evaluate add constraint FK_evaluate foreign key (userID)
      references user (userID) on delete restrict on update restrict;

alter table evaluate add constraint FK_evaluate2 foreign key (entrustmentID)
      references entrustment_form (entrustmentID) on delete restrict on update restrict;

alter table user add constraint FK_have foreign key (violationID)
      references Violation_record (violationID) on delete restrict on update restrict;

