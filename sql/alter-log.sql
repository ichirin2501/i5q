ALTER TABLE footprints ADD UNIQUE `uniq_user_id_owner_id` (`user_id`, `owner_id`);

ALTER TABLE relations ADD INDEX `idx_one_created_at` (`one`, `created_at`);

ALTER TABLE entries ADD INDEX `idx_user_id_private_created_at` (`user_id`, `private`, `created_at`);

ALTER TABLE comments ADD COLUMN `owner_id` int(11) NOT NULL;
UPDATE comments JOIN entries ON comments.entry_id = entries.id SET comments.owner_id = entries.user_id;
ALTER TABLE comments ADD INDEX `idx_owner_id_created_at` (`owner_id`, `created_at`);

ALTER TABLE users ADD COLUMN `salt` varchar(6) DEFAULT NULL;
UPDATE users JOIN salts ON users.id = salts.user_id SET users.salt = salts.salt;
