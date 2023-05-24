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

INSERT INTO video (id, title, thumbUrl, viewCnt, category) VALUES
('_DZxEBACTTs', "등근육 넓히는 운동 그만찾고 턱걸이+'이 운동' 하세요", "https://i.ytimg.com/vi/_DZxEBACTTs/hqdefault.jpg", 3595850, "복근"),
("1VImLS9eKdI", "고혈압 치료 위해 운동에 매달리면 몸 상합니다", "https://i.ytimg.com/vi/1VImLS9eKdI/hqdefault.jpg", 9028199, "상체"),
("2paxL9MmxWM", "[여자아이돌 다이어트댄스] 실제 감량 후기 폭발했던 4세대 여돌 플레이리스트로 2주 -5kg 도전 해보세요!", "https://i.ytimg.com/vi/2paxL9MmxWM/hqdefault.jpg", 4613190, "복근"),
("3e2LgnaXEz4", "벽운동으로 마른탄탄 슬림핏 만들기 #workout#shorts#홈트#다이어트#전신운동", "https://i.ytimg.com/vi/3e2LgnaXEz4/hqdefault.jpg", 6273272, "하체"),
("416o0DCO0BM", "[ENG] 하루 10분:fire: 홈트 이걸로 끝! 체지방 200% 태우는 전신 타바타 운동", "https://i.ytimg.com/vi/416o0DCO0BM/hqdefault.jpg", 6567039, "복근"),
('zruKSHfD7b4', '[ENG] 딱 20분🔥 하루 운동 끝장내는 전신 &amp; 아랫배 &amp; 타바타 올인원 루틴', 'https://i.ytimg.com/vi/zruKSHfD7b4/hqdefault.jpg', 9334353, '미정'),
('gMaB-fG4u4g', '전신 다이어트 최고의 운동 [칼소폭 찐 핵핵매운맛]', 'https://i.ytimg.com/vi/gMaB-fG4u4g/hqdefault.jpg', 4055295, '미정'),
('4id3lVJj42o', '집에서 유산소 운동 가보자고 #shorts', 'https://i.ytimg.com/vi/4id3lVJj42o/hqdefault.jpg', 6125613, '미정'),
('PK3gAfasWpI', '&quot;성공은 자신의 한계를 뛰어넘는 것에서 시작된다&quot; 운동노래 쇠힙 Playlist', 'https://i.ytimg.com/vi/PK3gAfasWpI/hqdefault.jpg', 8877419, '미정'),
('s5wzXW6qLW0', '맨몸 운동으로 이렇게 된 사람의 하루', 'https://i.ytimg.com/vi/s5wzXW6qLW0/hqdefault.jpg', 2919372, '미정'),
('myNjmnvI6x0', 'NO 층간소음 올인원 운동 - 40분 유산소운동 홈트 - 관절에 무리없이 체지방 태우기', 'https://i.ytimg.com/vi/myNjmnvI6x0/hqdefault.jpg', 4421206, '미정'),
('0iqP6WP2ET4', '뱃살빼기! 효과보장!! 15MIN STANDING ABS WORKOUT - No Talking , No Equipment', 'https://i.ytimg.com/vi/0iqP6WP2ET4/hqdefault.jpg', 8109189, '미정'),
('07hl4NS5A00', '어깨운동을 잘하는데 어깨가 안 커진다고요?', 'https://i.ytimg.com/vi/07hl4NS5A00/hqdefault.jpg', 8196149, '상체'),
('Kl0lfmnGMvk', '무인도로 가져갈 3가지 헬스운동', 'https://i.ytimg.com/vi/Kl0lfmnGMvk/hqdefault.jpg', 1292204, '미정'),
('Ju2UNX3NkDE', '운동 순서 x도 안 중요함(초급자는 루틴, 프로그램 하지 말자)', 'https://i.ytimg.com/vi/Ju2UNX3NkDE/hqdefault.jpg', 9156207, '미정'),
('KCAwey51gUc', '헬스초보자가 &#39;이 순서&#39;대로 운동하면, 무조건 벌크업됩니다! (헬린이 운동루틴/종류/순서/분할)', 'https://i.ytimg.com/vi/KCAwey51gUc/hqdefault.jpg', 9274641, '미정'),
('4kZHHPH6heY', 'NO 층간소음 - 고민없이 하나로 끝내는 전신운동 근력 유산소 - 운동 못한 날 죄책감 씻어줄 30분 홈트', 'https://i.ytimg.com/vi/4kZHHPH6heY/hqdefault.jpg', 3815846, '미정'),
('kj2Cx3QlVCQ', '카즈하님…솔직히 이렇게 운동하는 건 반칙이죠…ㅠㅜ [역대급 6분 뱃살 파괴 운동]', 'https://i.ytimg.com/vi/kj2Cx3QlVCQ/hqdefault.jpg', 6763476, '미정'),
('Qmzd9sdId7w', '시간날때 마다 힙을 튕겨보세요 [늙지않는운동]', 'https://i.ytimg.com/vi/Qmzd9sdId7w/hqdefault.jpg', 6982522, '미정'),
('czqSk2zuflg', '벽집고 1분만 운동 하세요 나잇살 똥배 싹 빠지고 허리통증 사라집니다 [벽 플랭크 트위스트]', 'https://i.ytimg.com/vi/czqSk2zuflg/hqdefault.jpg', 9890008, '미정'),
('kETh8T3it4k', '(층간소음X, 설명O) 복근운동과 유산소를 한번에❗️서서하는 복근운동 1탄🔥', 'https://i.ytimg.com/vi/kETh8T3it4k/hqdefault.jpg', 3667266, '복근'),
('CIsKSDueLjk', '등운동 앞으로 무조건 이렇게 하세요', 'https://i.ytimg.com/vi/CIsKSDueLjk/hqdefault.jpg', 7874544, '상체'),
('7TLk7pscICk', '(Sub)누워서하는 5분 복부운동!! 효과보장! (매일 2주만 해보세요!)', 'https://i.ytimg.com/vi/7TLk7pscICk/hqdefault.jpg', 624255, '복근'),
('HhYH9URzDF0', '알아두면 평생써먹는 최고 하체 운동 김신영, 홍현희 다이어트 벽스쿼트 자세', 'https://i.ytimg.com/vi/HhYH9URzDF0/hqdefault.jpg', 9098602, '하체'),
('hR1ZgDQqyVI', '🔥볼록 튀어나온 아랫뱃살🔥무조건 빠지는 역대급 뱃살폭파운동 (똥배/복부지방)', 'https://i.ytimg.com/vi/hR1ZgDQqyVI/hqdefault.jpg', 767221, '복근'),
('dpBYYEhdofI', '앞벅지 볼록, 뒷벅지 셀룰라이트, 허벅지 안쪽살 모조리 불태우고🔥 [여리탄탄 일자 허벅지] 되는 7일 루틴', 'https://i.ytimg.com/vi/dpBYYEhdofI/hqdefault.jpg', 4789758, '하체'),
('5MACh6ylf8g', '운동할때 들으려고 모은 &#39;레전드&#39; 운동노래 모음🎵 [Playlist]', 'https://i.ytimg.com/vi/5MACh6ylf8g/hqdefault.jpg', 2335641, '미정'),
('PoYzxj8Iy5M', '2주만에 복근 만드는 운동 2 MIN ABS WORKOUT', 'https://i.ytimg.com/vi/PoYzxj8Iy5M/hqdefault.jpg', 4399709, '복근'),
('VZ9VSCCGB1g', '팔운동 일타강사 #shorts', 'https://i.ytimg.com/vi/VZ9VSCCGB1g/hqdefault.jpg', 3899746, '미정'),
('46vQnzaZ6aU', '[ENG] (층간소음 X) 진짜 역대급 20분 루틴ㅣ전신올인원 I 힙으뜸 유산소 운동', 'https://i.ytimg.com/vi/46vQnzaZ6aU/hqdefault.jpg', 9233665, '미정'),
('niBKMCTNSr4', '슬림한 허벅지 만드는 10분 다리 운동! 편하게 서서 운동해요!', 'https://i.ytimg.com/vi/niBKMCTNSr4/hqdefault.jpg', 579928, '하체'),
('Z3tSRZqNsKI', '문신멸치국밥충의 불금 마무리 운동 #문신멸치국밥충 #머슬업 #링운동', 'https://i.ytimg.com/vi/Z3tSRZqNsKI/hqdefault.jpg', 5901796, '미정'),
('PSWO1pM-490', '자기전 2분! 누워서 하는 종아리 날씬해지는 스트레칭 운동', 'https://i.ytimg.com/vi/PSWO1pM-490/hqdefault.jpg', 1064952, '미정'),
('sqQpL1wKW6M', '12분 서서하는 복근운동 홈트레이닝 - 체지방 태우기는 보너스', 'https://i.ytimg.com/vi/sqQpL1wKW6M/hqdefault.jpg', 6841534, '복근'),
('4EKo44DUvjg', '살이 너무 빠지는 죽음의 타바타 운동 (no 층간소음) / Beautiful tabata workout', 'https://i.ytimg.com/vi/4EKo44DUvjg/hqdefault.jpg', 6952900, '미정'),
('2iCiGD8BDy0', '바로 자극오는 🍑힙업 운동🍑', 'https://i.ytimg.com/vi/2iCiGD8BDy0/hqdefault.jpg', 5092570, '미정'),
('BPkATnGBlE8', '&quot;오늘 아무것도 하지 않으면 내일 아무 일도 일어나지 않는다&quot; 운동노래 쇠힙 Playlist', 'https://i.ytimg.com/vi/BPkATnGBlE8/hqdefault.jpg', 2521203, '미정'),
('0yUoGjziXGQ', '목통증 사라지는 딱 1분 운동', 'https://i.ytimg.com/vi/0yUoGjziXGQ/hqdefault.jpg', 8760280, '미정'),
('l8g0dEdIqto', '뱃살삭제 그운동 돌탁댄스 몸치버전 쪼갠 돌탁댄스 good-bye belly fat for bad dancer', 'https://i.ytimg.com/vi/l8g0dEdIqto/hqdefault.jpg', 4137549, '미정'),
('ZSlp52IDzu0', '댄스 다이어트 끝판왕 체중감량 운동 다이어트 댄스 에어로빅', 'https://i.ytimg.com/vi/ZSlp52IDzu0/hqdefault.jpg', 774629, '미정'),
('RctfBY93uIM', '박재범 몸은 얼마나 운동해야 될까..', 'https://i.ytimg.com/vi/RctfBY93uIM/hqdefault.jpg', 378521, '미정'),
('eJBeiUYRm-8', '뱃살 내장지방 벽 짚고 이렇게 하면 싹 다 빠집니다! 걷기 대신 이 운동을 매일 하면 효과 최고입니다! [복부비만, 플랭크,뱃살빼는운동, 홈트레이닝,근력운동,맨몸운동]', 'https://i.ytimg.com/vi/eJBeiUYRm-8/hqdefault.jpg', 7662440, '복근'),
('swRNeYw1JkY', '하루 15분! 전신 칼로리 불태우는 다이어트 운동', 'https://i.ytimg.com/vi/swRNeYw1JkY/hqdefault.jpg', 530664, '미정'),
('lDsJi3_EW-Y', 'Lv.5 12분만에 체지방 100% 소각시키는 루틴 따라만하세요! [Only 12mins Fat Burning Workout]', 'https://i.ytimg.com/vi/lDsJi3_EW-Y/hqdefault.jpg', 473125, '미정');

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

DROP TABLE IF EXISTS `calendarLog`;

CREATE TABLE `calendarLog` (
    `id` VARCHAR(20) NOT NULL,
    `date` TIMESTAMP NOT NULL,
    `title` VARCHAR(200) NOT NULL,
    `content` VARCHAR(200) NOT NULL,
    PRIMARY KEY(`id`, `date`),
    CONSTRAINT `id_fk` FOREIGN KEY(`id`) REFERENCES `user` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

INSERT INTO calendarLog
VALUES
('ssafy1', '2023-05-21 00:00:00', '유산소 운동', '5분만 해도 땀이 뻘뻘;'),
('ssafy1', '2023-05-22 00:00:00', '유산소 운동', '5분만 해도 땀이 뻘뻘;'),
('ssafy1', '2023-05-23 00:00:00', '유산소 운동', '5분만 해도 땀이 뻘뻘;');

select * from calendarLog;