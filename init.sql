-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- 主機: 127.0.0.1
-- 產生時間： 2018-01-31 04:51:53
-- 伺服器版本: 10.1.29-MariaDB
-- PHP 版本： 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- 資料庫： `default_user_init`
--

-- --------------------------------------------------------

--
-- 資料表結構 `action`
--

CREATE TABLE `action` (
  `action_id` int(11) NOT NULL,
  `action_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='動作';

--
-- 資料表的匯出資料 `action`
--

INSERT INTO `action` (`action_id`, `action_name`) VALUES
(1, '登入'),
(2, '註冊'),
(3, '登出');

-- --------------------------------------------------------

--
-- 資料表結構 `history`
--

CREATE TABLE `history` (
  `history_id` int(11) NOT NULL,
  `history&action_id` int(11) NOT NULL,
  `history_content` longtext COLLATE utf8_unicode_ci,
  `history_created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '建立時間',
  `history_updated_at` datetime DEFAULT NULL COMMENT '修改時間',
  `history&user_id` int(11) NOT NULL COMMENT '這則紀錄是哪個使用者'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='歷史紀錄';

-- --------------------------------------------------------

--
-- 資料表結構 `photo`
--

CREATE TABLE `photo` (
  `photo_id` int(11) NOT NULL,
  `photo_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_s` int(11) DEFAULT NULL,
  `photo_m` int(11) DEFAULT NULL,
  `photo_l` int(11) DEFAULT NULL,
  `photo_created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `photo_update_at` datetime DEFAULT NULL,
  `photo&photo_type_id` int(11) NOT NULL COMMENT '照片的類別',
  `photo&user_id` int(11) NOT NULL COMMENT '照片是誰的',
  `photo&status_id` int(11) NOT NULL DEFAULT '7' COMMENT '狀態編號'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='相片';

-- --------------------------------------------------------

--
-- 資料表結構 `photo_has_photo_tag`
--

CREATE TABLE `photo_has_photo_tag` (
  `phpt_id` int(11) NOT NULL,
  `phpt&photo_id` int(11) NOT NULL,
  `phpt&photo_tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='哪些相片有哪些標籤';

-- --------------------------------------------------------

--
-- 資料表結構 `photo_tag`
--

CREATE TABLE `photo_tag` (
  `photo_tag_id` int(11) NOT NULL,
  `photo_tag_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_tag&user_id` int(11) NOT NULL COMMENT '哪個使用者建立'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='相片標籤';

-- --------------------------------------------------------

--
-- 資料表結構 `photo_type`
--

CREATE TABLE `photo_type` (
  `photo_type_id` int(11) NOT NULL,
  `photo_type_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='相片類型';

--
-- 資料表的匯出資料 `photo_type`
--

INSERT INTO `photo_type` (`photo_type_id`, `photo_type_name`) VALUES
(1, '頭像'),
(2, '封面照'),
(3, '一般照片');

-- --------------------------------------------------------

--
-- 資料表結構 `power`
--

CREATE TABLE `power` (
  `power_id` int(11) NOT NULL,
  `power_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `power&power_group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='權限表';

--
-- 資料表的匯出資料 `power`
--

INSERT INTO `power` (`power_id`, `power_name`, `power&power_group_id`) VALUES
(1, '登入系統', 1),
(2, '密碼查詢', 1),
(3, '修改個人資料', 1),
(4, '會員管理', 2),
(5, 'Log 查看', 2);

-- --------------------------------------------------------

--
-- 資料表結構 `power_group`
--

CREATE TABLE `power_group` (
  `power_group_id` int(11) NOT NULL,
  `power_group_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '權限群組名稱'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='權限群組';

--
-- 資料表的匯出資料 `power_group`
--

INSERT INTO `power_group` (`power_group_id`, `power_group_name`) VALUES
(1, '公開用戶'),
(2, '系統管理');

-- --------------------------------------------------------

--
-- 資料表結構 `status`
--

CREATE TABLE `status` (
  `status_id` int(11) NOT NULL,
  `status_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '狀態名稱',
  `status&status_type_id` int(11) NOT NULL COMMENT '狀態類型'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='狀態';

--
-- 資料表的匯出資料 `status`
--

INSERT INTO `status` (`status_id`, `status_name`, `status&status_type_id`) VALUES
(1, '停用', 1),
(2, '可用', 1),
(3, '刪除', 1),
(4, '未認證', 1),
(5, '認證中', 1),
(6, '完成認證', 1),
(7, '公開', 2),
(8, '草稿', 2),
(9, '隱藏', 2),
(10, '不公開', 2),
(11, '刪除', 2),
(12, '過期', 2);

-- --------------------------------------------------------

--
-- 資料表結構 `status_type`
--

CREATE TABLE `status_type` (
  `status_type_id` int(11) NOT NULL,
  `status_type_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='狀態類型';

--
-- 資料表的匯出資料 `status_type`
--

INSERT INTO `status_type` (`status_type_id`, `status_type_name`) VALUES
(1, '帳號狀態'),
(2, '文檔狀態');

-- --------------------------------------------------------

--
-- 資料表結構 `system`
--

CREATE TABLE `system` (
  `system_id` int(11) NOT NULL,
  `system_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='內部或第三方系統名稱';

--
-- 資料表的匯出資料 `system`
--

INSERT INTO `system` (`system_id`, `system_name`) VALUES
(1, 'local'),
(2, 'facebook'),
(3, 'google');

-- --------------------------------------------------------

--
-- 資料表結構 `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_password` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_display` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_first_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '名',
  `user_last_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '姓',
  `user&system_id` int(11) NOT NULL,
  `user_key` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '第三方用戶的唯一鍵',
  `user_email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_access_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '令牌',
  `user_access_token_expiry` datetime DEFAULT NULL COMMENT '令牌過期時間',
  `user_created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_lasted_at` datetime DEFAULT NULL,
  `user&user_identity_id` int(11) NOT NULL COMMENT '使用者身分',
  `user&status_id` int(11) NOT NULL DEFAULT '4'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='使用者';

--
-- 資料表的匯出資料 `user`
--

INSERT INTO `user` (`user_id`, `user_password`, `user_display`, `user_first_name`, `user_last_name`, `user&system_id`, `user_key`, `user_email`, `user_access_token`, `user_access_token_expiry`, `user_created_at`, `user_updated_at`, `user_lasted_at`, `user&user_identity_id`, `user&status_id`) VALUES
(1, NULL, '系統管理員', NULL, NULL, 1, NULL, 'fdjkgh580@gmail.com', NULL, NULL, '2018-01-31 11:17:10', '2018-01-31 11:41:03', NULL, 2, 5);

-- --------------------------------------------------------

--
-- 資料表結構 `user_identity`
--

CREATE TABLE `user_identity` (
  `user_identity_id` int(11) NOT NULL,
  `user_identity_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='使用者身分';

--
-- 資料表的匯出資料 `user_identity`
--

INSERT INTO `user_identity` (`user_identity_id`, `user_identity_name`) VALUES
(1, '會員'),
(2, '管理員');

-- --------------------------------------------------------

--
-- 資料表結構 `user_identity_has_power`
--

CREATE TABLE `user_identity_has_power` (
  `uihp_id` int(11) NOT NULL,
  `uihp&user_identity_id` int(11) NOT NULL,
  `uihp&power_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='哪些身分有哪些權限';

--
-- 資料表的匯出資料 `user_identity_has_power`
--

INSERT INTO `user_identity_has_power` (`uihp_id`, `uihp&user_identity_id`, `uihp&power_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 4),
(5, 2, 5);

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `action`
--
ALTER TABLE `action`
  ADD PRIMARY KEY (`action_id`);

--
-- 資料表索引 `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`history_id`),
  ADD KEY `fk_history_history_level` (`history&action_id`),
  ADD KEY `fk_history_user` (`history&user_id`);

--
-- 資料表索引 `photo`
--
ALTER TABLE `photo`
  ADD PRIMARY KEY (`photo_id`),
  ADD KEY `fk_photo_photo_type` (`photo&photo_type_id`),
  ADD KEY `fk_photo_user` (`photo&user_id`);

--
-- 資料表索引 `photo_has_photo_tag`
--
ALTER TABLE `photo_has_photo_tag`
  ADD PRIMARY KEY (`phpt_id`),
  ADD KEY `fk_photo_has_photo_tag_photo` (`phpt&photo_id`),
  ADD KEY `fk_photo_has_photo_tag_photo_tag` (`phpt&photo_tag_id`);

--
-- 資料表索引 `photo_tag`
--
ALTER TABLE `photo_tag`
  ADD PRIMARY KEY (`photo_tag_id`),
  ADD KEY `fk_photo_tag_user` (`photo_tag&user_id`);

--
-- 資料表索引 `photo_type`
--
ALTER TABLE `photo_type`
  ADD PRIMARY KEY (`photo_type_id`);

--
-- 資料表索引 `power`
--
ALTER TABLE `power`
  ADD PRIMARY KEY (`power_id`),
  ADD KEY `fk_power_power_type` (`power&power_group_id`);

--
-- 資料表索引 `power_group`
--
ALTER TABLE `power_group`
  ADD PRIMARY KEY (`power_group_id`);

--
-- 資料表索引 `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`status_id`),
  ADD KEY `fk_status_status_type` (`status&status_type_id`);

--
-- 資料表索引 `status_type`
--
ALTER TABLE `status_type`
  ADD PRIMARY KEY (`status_type_id`);

--
-- 資料表索引 `system`
--
ALTER TABLE `system`
  ADD PRIMARY KEY (`system_id`);

--
-- 資料表索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_email` (`user_email`),
  ADD KEY `user_system_id` (`user&system_id`),
  ADD KEY `fk_user_user_identity` (`user&user_identity_id`),
  ADD KEY `fk_user_status` (`user&status_id`);

--
-- 資料表索引 `user_identity`
--
ALTER TABLE `user_identity`
  ADD PRIMARY KEY (`user_identity_id`);

--
-- 資料表索引 `user_identity_has_power`
--
ALTER TABLE `user_identity_has_power`
  ADD PRIMARY KEY (`uihp_id`),
  ADD KEY `fk_user_identity_u_power_user_identity` (`uihp&user_identity_id`),
  ADD KEY `fk_user_identity_u_power_power` (`uihp&power_id`);

--
-- 在匯出的資料表使用 AUTO_INCREMENT
--

--
-- 使用資料表 AUTO_INCREMENT `action`
--
ALTER TABLE `action`
  MODIFY `action_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用資料表 AUTO_INCREMENT `history`
--
ALTER TABLE `history`
  MODIFY `history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `photo`
--
ALTER TABLE `photo`
  MODIFY `photo_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `photo_has_photo_tag`
--
ALTER TABLE `photo_has_photo_tag`
  MODIFY `phpt_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `photo_tag`
--
ALTER TABLE `photo_tag`
  MODIFY `photo_tag_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `photo_type`
--
ALTER TABLE `photo_type`
  MODIFY `photo_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用資料表 AUTO_INCREMENT `power`
--
ALTER TABLE `power`
  MODIFY `power_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用資料表 AUTO_INCREMENT `power_group`
--
ALTER TABLE `power_group`
  MODIFY `power_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表 AUTO_INCREMENT `status`
--
ALTER TABLE `status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 使用資料表 AUTO_INCREMENT `status_type`
--
ALTER TABLE `status_type`
  MODIFY `status_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表 AUTO_INCREMENT `system`
--
ALTER TABLE `system`
  MODIFY `system_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用資料表 AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表 AUTO_INCREMENT `user_identity`
--
ALTER TABLE `user_identity`
  MODIFY `user_identity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表 AUTO_INCREMENT `user_identity_has_power`
--
ALTER TABLE `user_identity_has_power`
  MODIFY `uihp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 已匯出資料表的限制(Constraint)
--

--
-- 資料表的 Constraints `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `fk_history_history_level` FOREIGN KEY (`history&action_id`) REFERENCES `action` (`action_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_history_user` FOREIGN KEY (`history&user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 資料表的 Constraints `photo`
--
ALTER TABLE `photo`
  ADD CONSTRAINT `fk_photo_photo_type` FOREIGN KEY (`photo&photo_type_id`) REFERENCES `photo_type` (`photo_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_photo_user` FOREIGN KEY (`photo&user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 資料表的 Constraints `photo_has_photo_tag`
--
ALTER TABLE `photo_has_photo_tag`
  ADD CONSTRAINT `fk_photo_has_photo_tag_photo` FOREIGN KEY (`phpt&photo_id`) REFERENCES `photo` (`photo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_photo_has_photo_tag_photo_tag` FOREIGN KEY (`phpt&photo_tag_id`) REFERENCES `photo_tag` (`photo_tag_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 資料表的 Constraints `photo_tag`
--
ALTER TABLE `photo_tag`
  ADD CONSTRAINT `fk_photo_tag_user` FOREIGN KEY (`photo_tag&user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 資料表的 Constraints `power`
--
ALTER TABLE `power`
  ADD CONSTRAINT `fk_power_power_type` FOREIGN KEY (`power&power_group_id`) REFERENCES `power_group` (`power_group_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 資料表的 Constraints `status`
--
ALTER TABLE `status`
  ADD CONSTRAINT `fk_status_status_type` FOREIGN KEY (`status&status_type_id`) REFERENCES `status_type` (`status_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 資料表的 Constraints `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_status` FOREIGN KEY (`user&status_id`) REFERENCES `status` (`status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_user_identity` FOREIGN KEY (`user&user_identity_id`) REFERENCES `user_identity` (`user_identity_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `user_user_system_id` FOREIGN KEY (`user&system_id`) REFERENCES `system` (`system_id`);

--
-- 資料表的 Constraints `user_identity_has_power`
--
ALTER TABLE `user_identity_has_power`
  ADD CONSTRAINT `fk_user_identity_u_power_power` FOREIGN KEY (`uihp&power_id`) REFERENCES `power` (`power_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_identity_u_power_user_identity` FOREIGN KEY (`uihp&user_identity_id`) REFERENCES `user_identity` (`user_identity_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;
