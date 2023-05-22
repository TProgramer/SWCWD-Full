DROP DATABASE IF EXISTS `ssafit`;
CREATE DATABASE ssafit DEFAULT CHARACTER SET utf8mb4;

USE `ssafit`;

DROP TABLE IF EXISTS `video`;

CREATE TABLE `video` (
    `id` VARCHAR(20) NOT NULL PRIMARY KEY,
    `title` VARCHAR(200) NOT NULL,
    `thumbUrl` VARCHAR(200) NOT NULL,
    `category` VARCHAR(20) NOT NULL,
    `viewCnt` INT NOT NULL DEFAULT 0
) ENGINE=InnoDB;

INSERT INTO video (id,title,thumbUrl,viewCnt,category) VALUES 
(
    '_DZxEBACTTs',
    "등근육 넓히는 운동 그만찾고 턱걸이+'이 운동' 하세요",
    "https://i.ytimg.com/vi/_DZxEBACTTs/hqdefault.jpg",
    3595850,
    "복근"
  ),
  (
    "1VImLS9eKdI",
    "고혈압 치료 위해 운동에 매달리면 몸 상합니다",
    "https://i.ytimg.com/vi/1VImLS9eKdI/hqdefault.jpg",
    9028199,
    "상체"
  ),
  (
    "2paxL9MmxWM",
    "[여자아이돌 다이어트댄스] 실제 감량 후기 폭발했던 4세대 여돌 플레이리스트로 2주 -5kg 도전 해보세요!",
    "https://i.ytimg.com/vi/2paxL9MmxWM/hqdefault.jpg",
    4613190,
    "복근"
 ),
  (
    "3e2LgnaXEz4",
    "벽운동으로 마른탄탄 슬림핏 만들기 #workout#shorts#홈트#다이어트#전신운동",
    "https://i.ytimg.com/vi/3e2LgnaXEz4/hqdefault.jpg",
    6273272,
    "하체"
  ),
  (
    "416o0DCO0BM",
    "[ENG] 하루 10분:fire: 홈트 이걸로 끝! 체지방 200% 태우는 전신 타바타 운동",
    "https://i.ytimg.com/vi/416o0DCO0BM/hqdefault.jpg",
    6567039,
    "복근"
  );



DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
    `id` VARCHAR(20) NOT NULL,
    `password` VARCHAR(20) NOT NULL,
    `name` VARCHAR(20) NOT NULL, -- 실명--
    `nickname` VARCHAR(20) NOT NULL UNIQUE KEY, -- 닉네임 --
    `email` VARCHAR(200) NOT NULL,
    `birthDay` VARCHAR(20) NOT NULL,
    `phoneNum` VARCHAR(200) NOT NULL,
    `regDate` TIMESTAMP NOT NULL DEFAULT now(),
    PRIMARY KEY(`id`)
) ENGINE=InnoDB;

INSERT INTO user (id, password, name, nickname, email, birthDay,phoneNum)
VALUES
("ssafy1", "1234", "김싸피", "zi존퀸ㅋr", "ssafy1@naver.com","19991216","01011112222"),
("ssafy2", "12345", "박싸피", "운동장철봉", "ssafy2@naver.com","19991217","01022223333"),
("ssafy3", "123456", "양싸피", "매운떡볶이", "ssafy3@naver.com","19981224","01033334444");

select * from user;

DROP TABLE IF EXISTS `review`;

CREATE TABLE `review` (
    `videoId` VARCHAR(20) NOT NULL,
    `id` INT AUTO_INCREMENT,
    `title` VARCHAR(200) NOT NULL,
    `writer` VARCHAR(20),
    `content` VARCHAR(200) NOT NULL,
    `viewCnt` INT NOT NULL DEFAULT 0,
    `createdAt` TIMESTAMP DEFAULT now(),
    `modifiedAt` TIMESTAMP  DEFAULT now(),
    PRIMARY KEY(`id`),
    CONSTRAINT `video_fk` FOREIGN KEY(`videoId`) REFERENCES `video` (`id`) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT `user_fk` FOREIGN KEY(`writer`) REFERENCES `user` (`nickname`) ON UPDATE CASCADE ON DELETE SET NULL
) ENGINE=InnoDB;

INSERT INTO review (videoId, title, writer, content)
VALUES
('_DZxEBACTTs', "효과과 너무 좋아요!", "zi존퀸ㅋr", "5분만 해도 땀 뻘뻘 납니다"),
("1VImLS9eKdI", "여기 잘먹네요;;", "운동장철봉", "효과미침"),
("2paxL9MmxWM", "저녁 햄버거 먹으려고요.", "매운떡볶이", "끝나고 햄버거 먹어도 될 정도의 강도ㄷㄷ");

select * from review;