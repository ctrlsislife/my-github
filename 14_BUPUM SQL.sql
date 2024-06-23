
create database bupum;

use bupum;

-- 테이블 생성
CREATE TABLE 회원정보 (
    회원ID INT NOT NULL,
    이름 VARCHAR(30) NOT NULL,
    주소 VARCHAR(50),
    전화번호 INT NOT NULL,
    PRIMARY KEY (회원ID)
);

CREATE TABLE 보유차량정보 (
    차대번호 INT NOT NULL,
    보유차량번호 INT NOT NULL,
    보유차량모델명 VARCHAR(30) NOT NULL,
    보유차량제조사 VARCHAR(30) NOT NULL,
    회원ID INT NOT NULL,
    PRIMARY KEY (차대번호),
    FOREIGN KEY (회원ID) REFERENCES 회원정보(회원ID)
);

CREATE TABLE 차량수리이력 (
    차대번호 INT NOT NULL,
    회원ID INT NOT NULL,
    수리일 VARCHAR(20) NOT NULL,
    수리내역 VARCHAR(60),
    PRIMARY KEY (수리일),
    FOREIGN KEY (회원ID) REFERENCES 회원정보(회원ID),
    FOREIGN KEY (차대번호) REFERENCES 보유차량정보(차대번호)
);

CREATE TABLE 부품보유점구분 (
    계열 VARCHAR(20) NOT NULL,
    상호 VARCHAR(30) NOT NULL,
    보유점주소 VARCHAR(30),
    보유점전화번호 VARCHAR(30),
    PRIMARY KEY (계열, 상호)
);

CREATE TABLE 부품보유점정보 (
    보유점코드 INT NOT NULL,
    계열 VARCHAR(20) NOT NULL,
    상호 VARCHAR(30) NOT NULL,
    PRIMARY KEY (보유점코드),
    FOREIGN KEY (계열, 상호) REFERENCES 부품보유점구분(계열, 상호)
);

CREATE TABLE 부품정보 (
    부품번호 INT NOT NULL,
    부품제조사 VARCHAR(30) NOT NULL,
    부품종류 VARCHAR(30),
    부품명 VARCHAR(80) NOT NULL,
    가격 INT NOT NULL,
    보유점코드 INT NOT NULL,
    PRIMARY KEY (부품번호),
    FOREIGN KEY (보유점코드) REFERENCES 부품보유점정보(보유점코드)
);

CREATE TABLE 부품재고 (
    부품번호 INT NOT NULL,
    보유점코드 INT NOT NULL,
    부품재고수 INT NOT NULL,
    PRIMARY KEY (부품번호),
    FOREIGN KEY (부품번호) REFERENCES 부품정보(부품번호),
    FOREIGN KEY (보유점코드) REFERENCES 부품보유점정보(보유점코드)
);

CREATE TABLE 구매이력 (
    회원ID INT NOT NULL,
    부품번호 INT NOT NULL,
    구매일 VARCHAR(20) NOT NULL,
    구매갯수 INT NOT NULL,
    FOREIGN KEY (회원ID) REFERENCES 회원정보(회원ID),
    FOREIGN KEY (부품번호) REFERENCES 부품정보(부품번호)
);

CREATE TABLE 부품사용차량정보 (
    부품번호 INT NOT NULL,
    차량모델번호 INT NOT NULL,
    차량모델명 VARCHAR(30) NOT NULL,
    차량제조사 VARCHAR(30) NOT NULL,
    PRIMARY KEY (차량모델번호),
    FOREIGN KEY (부품번호) REFERENCES 부품정보(부품번호)
);

CREATE TABLE 부품구매 (
    회원ID INT NOT NULL,
    부품번호 INT NOT NULL,
    부품구매개수 INT NOT NULL,
    부품배송수령여부 VARCHAR(20) NOT NULL,
    FOREIGN KEY (회원ID) REFERENCES 회원정보(회원ID),
    FOREIGN KEY (부품번호) REFERENCES 부품정보(부품번호)
);
-- 데이터 삽입
INSERT INTO 회원정보 VALUES (1, '김철수', '서울시 강남구 테헤란로 123', '01012345678');
INSERT INTO 회원정보 VALUES (2, '이영희', '서울시 서초구 서초대로 456', '01023456789');
INSERT INTO 회원정보 VALUES (3, '박민수', '서울시 송파구 잠실로 789', '01034567890');
INSERT INTO 회원정보 VALUES (4, '최지훈', '서울시 강동구 강동로 101', '01045678901');
INSERT INTO 회원정보 VALUES (5, '정수연', '서울시 강서구 공항대로 202', '01056789012');
INSERT INTO 회원정보 VALUES (6, '홍길동', '서울시 마포구 마포대로 303', '01067890123');
INSERT INTO 회원정보 VALUES (7, '유재석', '서울시 용산구 이태원로 404', '01078901234');
INSERT INTO 회원정보 VALUES (8, '박나래', '서울시 종로구 종로 505', '01089012345');
INSERT INTO 회원정보 VALUES (9, '장동건', '서울시 동작구 동작대로 606', '01090123456');
INSERT INTO 회원정보 VALUES (10, '한가인', '서울시 성동구 성수로 707', '01001234567');
INSERT INTO 회원정보 VALUES (11, '송중기', '서울시 중구 중림로 808', '01012345678');
INSERT INTO 회원정보 VALUES (12, '김태희', '서울시 서대문구 서대문로 909', '01023456789');
INSERT INTO 회원정보 VALUES (13, '정우성', '서울시 성북구 성북로 1010', '01034567890');
INSERT INTO 회원정보 VALUES (14, '이민호', '서울시 노원구 노원로 1111', '01045678901');
INSERT INTO 회원정보 VALUES (15, '수지', '서울시 도봉구 도봉로 1212', '01056789012');
INSERT INTO 회원정보 VALUES (16, '김수현', '서울시 은평구 은평로 1313', '01067890123');
INSERT INTO 회원정보 VALUES (17, '윤아', '서울시 강북구 강북로 1414', '01078901234');
INSERT INTO 회원정보 VALUES (18, '서강준', '서울시 관악구 관악로 1515', '01089012345');
INSERT INTO 회원정보 VALUES (19, '이종석', '서울시 구로구 구로로 1616', '01090123456');
INSERT INTO 회원정보 VALUES (20, '한효주', '서울시 금천구 금천로 1717', '01001234567');

INSERT INTO 보유차량정보 VALUES (1230123451, 2435, '투싼', '현대', 1);
INSERT INTO 보유차량정보 VALUES (1230123452, 3477, '쏘나타', '현대', 2);
INSERT INTO 보유차량정보 VALUES (1230123453, 6548, '쏘렌토', '기아', 3);
INSERT INTO 보유차량정보 VALUES (1230123454, 7254, 'K5', '기아', 4);
INSERT INTO 보유차량정보 VALUES (1230123455, 8952, '싼타페', '현대', 5);
INSERT INTO 보유차량정보 VALUES (1230123456, 6587, '스포티지', '기아', 6);
INSERT INTO 보유차량정보 VALUES (1230123457, 2577, '그랜저', '현대', 7);
INSERT INTO 보유차량정보 VALUES (1230123458, 1876, '제네시스', '현대', 8);
INSERT INTO 보유차량정보 VALUES (1230123459, 3748, '티볼리', '쌍용', 9);
INSERT INTO 보유차량정보 VALUES (1230123460, 5607, '아반떼', '현대', 10);
INSERT INTO 보유차량정보 VALUES (1230123461, 3410, '코나', '현대', 11);
INSERT INTO 보유차량정보 VALUES (1230123462, 7541, '셀토스', '기아', 12);
INSERT INTO 보유차량정보 VALUES (1230123463, 5201, '니로', '기아', 13);
INSERT INTO 보유차량정보 VALUES (1230123464, 7841, '스팅어', '기아', 14);
INSERT INTO 보유차량정보 VALUES (1230123465, 2088, 'K5', '기아', 15);
INSERT INTO 보유차량정보 VALUES (1230123466, 7777, '아반떼', '현대', 16);
INSERT INTO 보유차량정보 VALUES (1230123467, 1111, 'K5', '기아', 17);
INSERT INTO 보유차량정보 VALUES (1230123468, 8263, '아반떼', '현대', 18);
INSERT INTO 보유차량정보 VALUES (1230123469, 2000, 'K5', '기아', 19);
INSERT INTO 보유차량정보 VALUES (1230123470, 2024, '쏘나타', '현대', 20);

INSERT INTO 차량수리이력 VALUES (1230123451, 1, '20230115', '엔진 오일 교체');
INSERT INTO 차량수리이력 VALUES (1230123452, 2, '20230210', '타이어 교체');
INSERT INTO 차량수리이력 VALUES (1230123453, 3, '20230312', '브레이크 패드 교체');
INSERT INTO 차량수리이력 VALUES (1230123454, 4, '20230418', '배터리 교체');
INSERT INTO 차량수리이력 VALUES (1230123455, 5, '20230520', '에어컨 필터 교체');
INSERT INTO 차량수리이력 VALUES (1230123456, 6, '20230615', '연료 필터 교체');
INSERT INTO 차량수리이력 VALUES (1230123457, 7, '20230710', '브레이크액 교체');
INSERT INTO 차량수리이력 VALUES (1230123458, 8, '20230808', '와이퍼 교체');
INSERT INTO 차량수리이력 VALUES (1230123459, 9, '20230905', '타이어 정렬');
INSERT INTO 차량수리이력 VALUES (1230123460, 10, '20231015', '엔진 오일 교체');
INSERT INTO 차량수리이력 VALUES (1230123461, 11, '20231120', '타이어 교체');
INSERT INTO 차량수리이력 VALUES (1230123462, 12, '20231201', '브레이크 패드 교체');
INSERT INTO 차량수리이력 VALUES (1230123463, 13, '20240110', '배터리 교체');
INSERT INTO 차량수리이력 VALUES (1230123464, 14, '20240214', '에어컨 필터 교체');
INSERT INTO 차량수리이력 VALUES (1230123465, 15, '20240322', '연료 필터 교체');
INSERT INTO 차량수리이력 VALUES (1230123466, 16, '20240417', '브레이크액 교체');
INSERT INTO 차량수리이력 VALUES (1230123467, 17, '20240505', '와이퍼 교체');
INSERT INTO 차량수리이력 VALUES (1230123468, 18, '20240610', '타이어 정렬');
INSERT INTO 차량수리이력 VALUES (1230123469, 19, '20240715', '엔진 오일 교체');
INSERT INTO 차량수리이력 VALUES (1230123470, 20, '20240820', '타이어 교체');

INSERT INTO 부품보유점구분 VALUES ('자동차 대리점', '현대자동차 서울 HQ', '서울특별시 강남구 역삼동 123번지', '02-1234-5678');
INSERT INTO 부품보유점구분 VALUES ('자동차 수리점', '현대자동차 인천 부품대리점', '인천광역시 남구 학익동 456번지', '032-9876-5432');
INSERT INTO 부품보유점구분 VALUES ('자동차 대리점', '현대자동차 영남 플래그십 스토어', '대구광역시 북구 산격동 789번지', '053-6543-2109');
INSERT INTO 부품보유점구분 VALUES ('자동차 수리점', '현대모비스 영남 거점 사업소', '부산광역시 해운대구 우동 321번지', '051-7890-4321');
INSERT INTO 부품보유점구분 VALUES ('자동차 수리점', '제네시스 서비스 여의도', '서울특별시 영등포구 여의도동 567번지', '02-3456-7890');
INSERT INTO 부품보유점구분 VALUES ('자동차 서비스', '블루핸즈 경기 거점 사업소', '경기도 성남시 분당구 정자동 654번지', '031-2345-6789');
INSERT INTO 부품보유점구분 VALUES ('자동차 대리점', '현대자동차 중앙 허브', '대전광역시 서구 둔산동 987번지', '042-8765-4321');
INSERT INTO 부품보유점구분 VALUES ('자동차 서비스', '현대모비스 인천 물류센터', '인천광역시 남동구 구월동 109번지', '032-5678-9012');

select * from 부품보유점정보;
INSERT INTO 부품보유점정보 VALUES (01, '자동차 대리점', '현대자동차 서울 HQ');
INSERT INTO 부품보유점정보 VALUES (02, '자동차 수리점', '현대자동차 인천 부품대리점');
INSERT INTO 부품보유점정보 VALUES (03, '자동차 대리점', '현대자동차 영남 플래그십 스토어');
INSERT INTO 부품보유점정보 VALUES (04, '자동차 수리점', '현대모비스 영남 거점 사업소');
INSERT INTO 부품보유점정보 VALUES (05, '자동차 수리점', '제네시스 서비스 여의도');
INSERT INTO 부품보유점정보 VALUES (06, '자동차 서비스', '블루핸즈 경기 거점 사업소');
INSERT INTO 부품보유점정보 VALUES (07, '자동차 대리점', '현대자동차 중앙 허브');
INSERT INTO 부품보유점정보 VALUES (08, '자동차 서비스', '현대모비스 인천 물류센터');


INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('101', '의헌정밀기공', '엔진', '실린더 블록 (Cylinder Block)', 500000, '01');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('102', '병렬금속산업', '엔진', '실린더 헤드 (Cylinder Head)', 400000, '01');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('103', '대산피스톤', '엔진', '피스톤 (Piston)', 80000, '01');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('104', '순천금속산업', '엔진', '피스톤 링 (Piston Ring)', 20000, '01');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('105', '금호금속', '엔진', '피스톤 핀 (Piston Pin)', 10000, '01');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('106', '현대모비스', '엔진', '커넥팅 로드 (Connecting Rod)', 60000, '01');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('107', '현대모비스', '엔진', '크랭크 샤프트 (Crankshaft)', 300000, '01');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('108', '현대모비스', '엔진', '캠샤프트 (Camshaft)', 150000, '01');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('109', '대산정밀기공', '엔진', '흡기 밸브 (Intake Valve)', 50000, '01');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('110', '대산정밀기공', '엔진', '배기 밸브 (Outer Valve)', 40000, '01');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('111', '대산정밀기공', '엔진', '밸브 스프링 (Valve Spring)', 15000, '01');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('112', '대산정밀기공', '엔진', '밸브 리프터 (Valve Lifter)', 25000, '01');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('113', '유한금속', '엔진', '타이밍 체인/벨트 (Timing Chain/Belt)', 100000, '01');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('114', '현대모비스', '엔진', '플라이휠 (Flywheel)', 70000, '01');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('115', '강산유압', '엔진', '오일 펌프 (Oil Pump)', 80000, '01');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('116', 'Ford Motor Company', '엔진', '워터 펌프 (Water Pump)', 60000, '01');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('117', 'Bosch', '엔진', '오일 필터 (Oil Filter)', 10000, '01');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('118', 'Bosch', '엔진', '연료 인젝터 (Fuel Injector)', 120000, '01');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('119', '대흥유압', '엔진', '연료 펌프 (Fuel Pump)', 90000, '01');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('120', '현대모비스', '엔진', '점화 플러그 (Spark Plug)', 5000, '01');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('121', '현대모비스', '엔진', '점화 코일 (Ignition Coil)', 30000, '01');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('122', '대한pp', '엔진', '흡기 매니폴드 (Intake Manifold)', 80000, '01');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('123', '대한금속', '엔진', '배기 매니폴드 (Exhaust Manifold)', 70000, '01');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('124', 'MAN Motor Company', '엔진', '터보 (Turbocharger)', 200000, '01');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('125', 'MAN Motor Company', '엔진', '인터쿨러 (Intercooler)', 150000, '01');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('126', '대신기공', '엔진', '스로틀 바디 (Throttle Body)', 100000, '01');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('127', '아시아 필터', '엔진', '에어 필터 (Air Filter)', 20000, '01');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('128', '아시아 기계기술', '엔진', '라디에이터 (Radiator)', 300000, '01');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('129', '아시아 기계기술', '엔진', '서모스탯 (Thermostat)', 50000, '01');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('130', 'Bosch', '엔진', '엔진 컨트롤 유닛 (ECU, Engine Control Unit)', 400000, '01');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('131', 'Bosch', '엔진', 'EGR 밸브 (EGR Valve, Exhaust Gas Recirculation Valve)', 60000, '01');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('132', '현대모비스', '엔진', '엔진 마운트 (Engine Mount)', 100000, '01');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('133', '현대모비스', '엔진', '실린더 라이너 (Cylinder Liner)', 120000, '01');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('134', '현대모비스', '엔진', '베어링 (Bearing)', 15000, '01');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('135', '현대제철', '엔진', '오일 팬 (Oil Pan)', 30000, '01');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('136', '신흥고무제조', '엔진', '팬 벨트 (Fan Belt)', 20000, '01');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('137', '신흥유압', '엔진', '파워 스티어링 펌프 (Power Steering Pump)', 80000, '01');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('138', 'Nissan Motor Company', '엔진', '발전기 (Alternator)', 150000, '01');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('139', '현대모비스', '엔진', '엔진 배선 하네스 (Engine Wiring Harness)', 180000, '01');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('140', '현대모비스', '엔진', '매스 에어 플로우 센서 (MAF Sensor, Mass Air Flow Sensor)', 70000, '01');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('141', '신일계측', '엔진', '산소 센서 (Oxygen Sensor)', 50000, '02');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('142', '신일계측', '엔진', '노크 센서 (Knock Sensor)', 30000, '02');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('143', '현대모비스', '엔진', '캠샤프트 포지션 센서 (Camshaft Position Sensor)', 60000, '02');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('144', '현대모비스', '엔진', '크랭크샤프트 포지션 센서 (Crankshaft Position Sensor)', 55000, '02');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('145', '현대모비스', '엔진', '냉각수 온도 센서 (Coolant Temperature Sensor)', 25000, '02');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('146', '현대모비스', '엔진', '엔진 오일 압력 센서 (Engine Oil Pressure Sensor)', 30000, '02');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('147', '진흥고무산업', '엔진', '진공 호스 (Vacuum Hose)', 8000, '02');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('148', '현대모비스', '엔진', '가스켓 (Gasket)', 5000, '02');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('149', '현대모비스', '엔진', '헤드 가스켓 (Head Gasket)', 15000, '02');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('150', '현대모비스', '엔진', '실린더 헤드 볼트 (Cylinder Head Bolt)', 10000, '02');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('151', '현대모비스', '엔진', '서지 탱크 (Surge Tank)', 70000, '02');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('152', '현대모비스', '엔진', '밸브 가이드 (Valve Guide)', 8000, '02');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('153', '현대모비스', '엔진', '밸브 시트 (Valve Seat)', 10000, '02');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('154', '현대모비스', '엔진', '크랭크케이스 (Crankcase)', 50000, '02');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('155', '현대모비스', '엔진', '타이밍 커버 (Timing Cover)', 30000, '02');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('156', '현대모비스', '엔진', '밸런스 샤프트 (Balance Shaft)', 60000, '02');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('157', '유진공업', '엔진', '로커 암 (Rocker Arm)', 20000, '02');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('158', '유진공업', '엔진', '로커 커버 (Rocker Cover)', 25000, '02');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('159', '재홍산업', '엔진', '밸브 커버 (Valve Cover)', 30000, '02');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('160', '현대모비스', '엔진', '오일 팬 가스켓 (Oil Pan Gasket)', 5000, '02');

SELECT *
FROM 부품정보
WHERE 부품종류 = '외장';

INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('161', 'Jatco', '미션', '토크 컨버터 (Torque Converter)', 200000, '02');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('162', '현대모비스', '미션', '플래닛기어셋 (Planetary Gear Set)', 150000, '02');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('163', '현대모비스', '미션', '오일 펌프 (Oil Pump)', 50000, '02');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('164', 'Getrag', '미션', '클러치팩 (Clutch Pack)', 80000, '02');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('165', '현대모비스', '미션', '밴드 브레이크 (Band Brake)', 30000, '02');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('166', '현대모비스', '미션', '밸브 바디 (Valve Body)', 70000, '02');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('167', '현대모비스', '미션', '솔레노이드 밸브 (Solenoid Valve)', 40000, '02');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('168', '현대모비스', '미션', '오일 쿨러 (Oil Cooler)', 60000, '02');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('169', '기흥산업', '미션', '유압 컨트롤 유닛 (Hydraulic Control Unit)', 100000, '02');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('170', '순천제일기공', '미션', '인풋 샤프트 (Input Shaft)', 90000, '02');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('171', '순천제일기공', '미션', '듀얼 클러치 (Dual Clutch set)', 120000, '02');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('172', '현대모비스', '미션', '액추에이터 (Actuator)', 80000, '02');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('173', '순천제일기공', '미션', '기어 세트 (Gear Set)', 130000, '02');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('174', '거산정밀산업', '미션', '메카트로닉스 유닛 (Mechatronics Unit)', 150000, '03');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('175', '거산정밀산업', '미션', '변속 모듈 (Shift Module)', 110000, '03');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('176', '현대모비스', '미션', '기어 셀렉터 포크 (Gear Selector Fork)', 50000, '03');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('177', '현대모비스', '미션', '유압 컨트롤 모듈 (Hydraulic Control Module)', 90000, '03');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('178', '현대모비스', '미션', '오일 필터 (Oil Filter)', 8000, '03');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('179', '현대모비스', '미션', '풀리 (Pulley)', 15000, '03');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('180', '현대모비스', '미션', '벨트/체인 (Belt/Chain)', 20000, '03');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('181', '현대모비스', '미션', '주행 풀리 (Driving Pulley)', 25000, '03');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('182', '현대모비스', '미션', '종속 풀리 (Driven Pulley)', 27000, '03');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('183', '여수정밀산업', '미션', '주행 풀리 (Driving Pulley)', 30000, '03');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('184', '여수정밀산업', '미션', '종속 풀리 (Driven Pulley)', 32000, '03');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('185', '현대모비스', '미션', '벨트 텐셔너 (Belt Tensioner)', 25000, '03');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('186', '일산공업', '미션', '압력 센서 (Pressure Sensor)', 15000, '03');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('187', 'Bosch', '미션', '트랜스미션 컨트롤 유닛 (TCU, Transmission Control Unit)', 180000, '03');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('188', '현대모비스', '미션', '트랜스미션 오일 팬 (Transmission Oil Pan)', 35000, '03');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('189', '현대모비스', '미션', '오일 씰 (Oil Seal)', 8000, '03');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('190', '현대모비스', '미션', '베어링 (Bearing)', 10000, '03');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('191', '기흥정밀공업', '미션', '기어 트레인 (Gear Train)', 60000, '03');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('192', '현대모비스', '미션', '오일 레벨 게이지 (Oil Level Gauge)', 12000, '03');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('193', '현대모비스', '미션', '트랜스미션 케이스 (Transmission Case)', 45000, '03');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('194', '가상공업', '미션', '샤프트 (Shaft)', 28000, '03');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('195', '현대모비스', '미션', '오일 쿨러 라인 (Oil Cooler Line)', 18000, '03');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('196', '다산기공', '미션', '클러치 디스크 (Clutch Disc)', 35000, '04');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('197', '다산기공', '미션', '입력 센서 (Input Sensor)', 14000, '04');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('198', '현대모비스', '미션', '출력 센서 (Output Sensor)', 16000, '04');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('199', '가중산업', '미션', '스로틀 포지션 센서 (Throttle Position Sensor)', 12000, '04');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('200', '보흥정밀', '미션', '엔진 RPM 센서 (Engine RPM Sensor)', 13000, '04');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('201', '현대모비스', '미션', '속도 센서 (Speed Sensor)', 11000, '04');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('202', '현대모비스', '미션', '변속 레버 (Shift Lever)', 20000, '04');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('203', '공흥정밀', '미션', '트랜스미션 마운트 (Transmission Mount)', 25000, '04');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('204', '순천산업', '미션', '드라이브 샤프트 (Drive Shaft)', 30000, '04');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('205', 'Jeep Motor Company', '미션', '유니버설 조인트 (Universal Joint)', 28000, '04');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('206', 'Jeep Motor Company', '미션', 'CV 조인트 (CV Joint)', 30000, '04');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('207', 'FH 산업', '미션', '플렉스 플레이트 (Flex Plate)', 25000, '04');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('208', 'GS기공', '미션', '커버터 클러치 (Converter Clutch)', 35000, '04');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('209', '대일산업', '미션', '서보 피스톤 (Servo Piston)', 18000, '04');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('210', '고흥사', '미션', '밴드 어저스트 스크류 (Band Adjust Screw)', 12000, '04');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('211', '대흥사', '미션', '중립 안전 스위치 (Neutral Safety Switch)', 15000, '04');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('212', '조흥사', '미션', '리버스 기어 (Reverse Gear)', 40000, '04');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('213', '대전사', '미션', '프론트 펌프 (Front Pump)', 30000, '04');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('214', '제조사JJJ', '미션', '레토드 기어 (Retarder Gear)', 35000, '04');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('215', 'Volvo Motor Company', '미션', '오버드라이브 기어 (Overdrive Gear)', 38000, '04');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('216', '현대모비스', '미션', '프릭션 디스크 (Friction Disc)', 22000, '04');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('217', '현대모비스', '미션', '변속 케이블 (Shift Cable)', 18000, '04');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('218', '현대모비스', '미션', '변속기 오일 (Transmission Fluid)', 10000, '04');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('219', '현대모비스', '미션', '유압 어큐뮬레이터 (Hydraulic Accumulator)', 28000, '04');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('220', '현대모비스', '미션', '변속기 오일 필터 (Transmission Fluid Filter)', 8000, '04');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('221', '배흥산업', '미션', '브레이크 밴드 (Brake Band)', 30000, '04');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('222', '현대모비스', '미션', '기어 셀렉터 (Gear Selector)', 25000, '04');

INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('223', 'Monroe', '하체', '서스펜션 스프링 (Suspension Spring)', 45000, '04');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('224', 'Monroe', '하체', '쇽 업소버 (Shock Absorber)', 60000, '04');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('225', '현대모비스', '하체', '컨트롤 암 (Control Arm)', 55000, '04');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('226', '현대모비스', '하체', '스테빌라이저 바 (Stabilizer Bar)', 35000, '04');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('227', '현대모비스', '하체', '스테빌라이저 링크 (Stabilizer Link)', 25000, '05');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('228', '제흥산업', '하체', '타이로드 엔드 (Tie Rod End)', 18000, '05');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('229', '3SM정밀기공', '하체', '스티어링 너클 (Steering Knuckle)', 40000, '05');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('230', '안흥정밀가공산업', '하체', '볼 조인트 (Ball Joint)', 30000, '05');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('231', '도은 베어링', '하체', '휠 베어링 (Wheel Bearing)', 25000, '05');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('232', '시영정밀공업', '하체', '휠 허브 (Wheel Hub)', 28000, '05');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('233', '대흥섀시', '하체', '서브프레임 (Subframe)', 70000, '05');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('234', '대흥섀시', '하체', '크로스멤버 (Crossmember)', 45000, '05');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('235', '현대모비스', '하체', '로어 컨트롤 암 (Lower Control Arm)', 48000, '05');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('236', '현대모비스', '하체', '어퍼 컨트롤 암 (Upper Control Arm)', 50000, '05');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('237', 'Renault Motor Company', '하체', '토션 바 (Torsion Bar)', 38000, '05');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('238', 'Ssangyong Motor Company', '하체', '트레일링 암 (Trailing Arm)', 42000, '05');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('239', 'GM Motor Company', '하체', '스트럿 (Strut)', 55000, '05');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('240', '현대모비스', '하체', '코일 스프링 (Coil Spring)', 38000, '05');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('241', '현대모비스', '하체', '리프 스프링 (Leaf Spring)', 60000, '05');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('242', '현대모비스', '하체', '안티롤 바 (Anti-Roll Bar)', 32000, '05');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('243', '상현고무산업', '하체', '서스펜션 부싱 (Suspension Bushing)', 15000, '05');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('244', '승원고무산업', '하체', '서스펜션 마운트 (Suspension Mount)', 20000, '05');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('245', '아름정밀기공', '하체', '드라이브 샤프트 (Drive Shaft)', 70000, '05');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('246', '현철금속산업', '하체', 'CV 조인트 (CV Joint)', 40000, '05');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('247', '수민금속', '하체', '프로펠러 샤프트 (Propeller Shaft)', 85000, '05');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('248', '대산디파란셜', '하체', '디퍼렌셜 (Differential)', 120000, '05');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('249', '정우산업', '하체', '핀언 기어 (Pinion Gear)', 55000, '05');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('250', '부영산업', '하체', '링 기어 (Ring Gear)', 60000, '05');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('251', '대주산업', '하체', '드라이브 플랜지 (Drive Flange)', 35000, '05');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('252', '히타치 공업', '하체', '액슬 샤프트 (Axle Shaft)', 48000, '05');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('253', '제준산업', '하체', '휠 스페이서 (Wheel Spacer)', 25000, '05');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('254', '윤호볼트', '하체', '휠 러그 너트 (Wheel Lug Nut)', 5000, '05');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('255', '대거산업', '하체', '휠 림 (Wheel Rim)', 70000, '05');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('256', '금호타이어', '하체', '타이어 (Tire)', 120000, '05');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('257', '춘흥프라스틱', '하체', '머드가드 (Mudguard)', 30000, '05');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('258', 'Brembo', '하체', '브레이크 디스크 (Brake Disc)', 80000, '05');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('259', 'Brembo', '하체', '브레이크 캘리퍼 (Brake Caliper)', 65000, '05');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('260', '현대모비스', '하체', '브레이크 패드 (Brake Pad)', 35000, '05');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('261', '현대모비스', '하체', '브레이크 드럼 (Brake Drum)', 40000, '05');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('262', '현대모비스', '하체', '브레이크 슈 (Brake Shoe)', 30000, '05');

INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('263', '현대모비스', '외장', '프론트 범퍼 (Front Bumper)', 150000, '05');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('264', '현대모비스', '외장', '리어 범퍼 (Rear Bumper)', 120000, '05');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('265', '현대모비스', '외장', '후드 (Hood)', 180000, '06');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('266', '현대모비스', '외장', '프론트 그릴 (Front Grille)', 80000, '06');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('267', '현대모비스', '외장', '헤드라이트 (Headlight)', 120000, '06');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('268', '현대모비스', '외장', '테일라이트 (Taillight)', 100000, '06');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('269', '현대모비스', '외장', '사이드 미러 좌 (Left Side Mirror)', 50000, '06');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('270', '현대모비스', '외장', '사이드 미러 우 (Right Side Mirror)', 50000, '06');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('271', '현대모비스', '외장', '도어 핸들 (Door Handle)', 30000, '06');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('272', '현대모비스', '외장', '도어 패널 전좌 (Front Left Door Panel)', 120000, '06');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('273', '현대모비스', '외장', '도어 패널 전우 (Front Right Door Panel)', 120000, '06');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('274', '현대모비스', '외장', '도어 패널 후좌 (Rear Left Door Panel)', 100000, '06');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('275', '현대모비스', '외장', '도어 패널 후우 (Rear Right Door Panel)', 100000, '06');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('276', '현대모비스', '외장', '프론트 휀더 좌 (Front Left Fender)', 70000, '06');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('277', '현대모비스', '외장', '프론트 휀더 우 (Front Right Fender)', 70000, '06');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('278', '현대모비스', '외장', '리어 휀더 좌 (Rear Left Fender)', 65000, '06');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('279', '현대모비스', '외장', '리어 휀더 우 (Rear Right Fender)', 65000, '06');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('280', '현대모비스', '외장', '루프 (Roof)', 200000, '06');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('281', '현대모비스', '외장', '트렁크 리드 (Trunk Lid)', 150000, '06');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('282', '현대모비스', '외장', '사이드 스커트 좌 (Left Side Skirt)', 80000, '06');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('283', '현대모비스', '외장', '사이드 스커트 우 (Right Side Skirt)', 80000, '06');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('284', '현대모비스', '외장', '휠 아치 몰딩 (Wheel Arch Molding)', 60000, '06');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('285', '현대모비스', '외장', '리어 디퓨저 (Rear Diffuser)', 90000, '06');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('286', '현대모비스', '외장', '사이드 몰딩 (Side Molding)', 50000, '06');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('287', '현대모비스', '외장', '루프 레일 (Roof Rail)', 70000, '06');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('288', 'saint gobain', '외장', '선루프 (Sunroof)', 250000, '06');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('289', 'saint gobain', '외장', '리어 윈도우 (Rear Window)', 80000, '07');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('290', 'saint gobain', '외장', '프론트 윈도우 (Front Window)', 90000, '07');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('291', '현대모비스', '외장', '윈도우 레귤레이터 (Window Regulator)', 60000, '07');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('292', '대흥사', '외장', '와이퍼 블레이드 (Wiper Blade)', 30000, '07');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('293', '대흥사', '외장', '와이퍼 암 (Wiper Arm)', 35000, '07');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('294', '현대모비스', '외장', '도어 실 플레이트 (Door Sill Plate)', 40000, '08');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('295', '현대모비스', '외장', '휠 커버 (Wheel Cover)', 20000, '08');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('296', '현대모비스', '외장', '프론트 범퍼 립 (Front Bumper Lip)', 50000, '08');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('297', '현대모비스', '외장', '도어 스토퍼 (Door Stopper)', 15000, '08');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('298', 'Nikon', '외장', '리어 뷰 카메라 (Rear View Camera)', 70000, '08');
INSERT INTO 부품정보 (부품번호, 부품제조사, 부품종류, 부품명, 가격, 보유점코드)
VALUES ('299', '현대모비스', '외장', '휠 림 프로텍터 (Wheel Rim Protector)', 25000, '08');

INSERT INTO 부품재고 VALUES (195, 02, 23);
INSERT INTO 부품재고 VALUES (224, 03, 3);
INSERT INTO 부품재고 VALUES (193, 06, 83);
INSERT INTO 부품재고 VALUES (123, 08, 22);
INSERT INTO 부품재고 VALUES (181, 01, 13);
INSERT INTO 부품재고 VALUES (122, 03, 56);
INSERT INTO 부품재고 VALUES (108, 06, 8);
INSERT INTO 부품재고 VALUES (177, 05, 66);
INSERT INTO 부품재고 VALUES (166, 04, 20);
INSERT INTO 부품재고 VALUES (133, 02, 13);
INSERT INTO 부품재고 VALUES (125, 01, 55);
INSERT INTO 부품재고 VALUES (144, 06, 9);
INSERT INTO 부품재고 VALUES (155, 05, 35);
INSERT INTO 부품재고 VALUES (178, 08, 63);
INSERT INTO 부품재고 VALUES (173, 02, 42);
INSERT INTO 부품재고 VALUES (212, 03, 16);
INSERT INTO 부품재고 VALUES (200, 05, 18);
INSERT INTO 부품재고 VALUES (146, 07, 11);
INSERT INTO 부품재고 VALUES (134, 08, 73);
INSERT INTO 부품재고 VALUES (158, 06, 35);
INSERT INTO 부품재고 VALUES (288, 07, 44);

SELECT * FROM 부품구매;
INSERT INTO 구매이력 VALUES (11, 155, 20240203, 2);
INSERT INTO 구매이력 VALUES (10, 145, 20240603, 1);
INSERT INTO 구매이력 VALUES (1, 280, 20240716, 1);
INSERT INTO 구매이력 VALUES (6, 266, 20240223, 1);
INSERT INTO 구매이력 VALUES (8, 177, 20240921, 1);
INSERT INTO 구매이력 VALUES (7, 165, 20241103, 3);
INSERT INTO 구매이력 VALUES (6, 196, 20240617, 4);
INSERT INTO 구매이력 VALUES (9, 206, 20240122, 2);
INSERT INTO 구매이력 VALUES (16, 123, 20240728, 1);
INSERT INTO 구매이력 VALUES (16, 157, 20241225, 1);

INSERT INTO 부품구매 VALUES (1, 148, 1, '배송');
INSERT INTO 부품구매 VALUES (2, 188, 2, '직접수령');
INSERT INTO 부품구매 VALUES (3, 215, 1, '배송');
INSERT INTO 부품구매 VALUES (4, 109, 2, '직접수령');
INSERT INTO 부품구매 VALUES (5, 156, 1, '배송');
INSERT INTO 부품구매 VALUES (6, 183, 2, '배송');
INSERT INTO 부품구매 VALUES (7, 122, 3, '배송');
INSERT INTO 부품구매 VALUES (8, 166, 4, '배송');
INSERT INTO 부품구매 VALUES (9, 176, 1, '직접수령');
INSERT INTO 부품구매 VALUES (10, 276, 2, '배송');


INSERT INTO 부품사용차량정보 VALUES ('101', '36785', '그랜저', '현대');
INSERT INTO 부품사용차량정보 VALUES ('102', '52479', '소나타', '현대');
INSERT INTO 부품사용차량정보 VALUES ('103', '81504', '쏘렌토', '현대');
INSERT INTO 부품사용차량정보 VALUES ('104', '23916', '투싼', '현대');
INSERT INTO 부품사용차량정보 VALUES ('105', '60823', 'K5', '기아');
INSERT INTO 부품사용차량정보 VALUES ('106', '73216', 'K3', '기아');
INSERT INTO 부품사용차량정보 VALUES ('107', '48927', '스포티지', '기아');
INSERT INTO 부품사용차량정보 VALUES ('108', '91634', '셀토스', '기아');
INSERT INTO 부품사용차량정보 VALUES ('109', '17592', '모하비', '기아');
INSERT INTO 부품사용차량정보 VALUES ('110', '30578', '아반떼', '현대');
INSERT INTO 부품사용차량정보 VALUES ('111', '64102', '투싼', '현대');
INSERT INTO 부품사용차량정보 VALUES ('112', '94267', '팰리세이드', '현대');
INSERT INTO 부품사용차량정보 VALUES ('113', '82745', '카니발', '기아');
INSERT INTO 부품사용차량정보 VALUES ('114', '50381', '쏘나타', '현대');
INSERT INTO 부품사용차량정보 VALUES ('115', '42619', '쏘렌토', '현대');
INSERT INTO 부품사용차량정보 VALUES ('116', '27486', '투싼', '현대');
INSERT INTO 부품사용차량정보 VALUES ('117', '71826', 'K5', '기아');
INSERT INTO 부품사용차량정보 VALUES ('118', '96037', 'K3', '기아');
INSERT INTO 부품사용차량정보 VALUES ('119', '58431', '스포티지', '기아');
INSERT INTO 부품사용차량정보 VALUES ('120', '13258', '셀토스', '기아');
INSERT INTO 부품사용차량정보 VALUES ('121', '39754', '모하비', '기아');
INSERT INTO 부품사용차량정보 VALUES ('122', '68204', '아반떼', '현대');
INSERT INTO 부품사용차량정보 VALUES ('123', '84027', '투싼', '현대');
INSERT INTO 부품사용차량정보 VALUES ('124', '45931', '팰리세이드', '현대');
INSERT INTO 부품사용차량정보 VALUES ('125', '37592', '카니발', '기아');
INSERT INTO 부품사용차량정보 VALUES ('126', '53186', '쏘나타', '현대');
INSERT INTO 부품사용차량정보 VALUES ('127', '24897', '쏘렌토', '현대');
INSERT INTO 부품사용차량정보 VALUES ('128', '97315', '투싼', '현대');
INSERT INTO 부품사용차량정보 VALUES ('129', '70612', 'K5', '기아');
INSERT INTO 부품사용차량정보 VALUES ('130', '82954', 'K3', '기아');
INSERT INTO 부품사용차량정보 VALUES ('131', '68427', '스포티지', '기아');
INSERT INTO 부품사용차량정보 VALUES ('132', '14593', '셀토스', '기아');
INSERT INTO 부품사용차량정보 VALUES ('133', '52036', '모하비', '기아');
INSERT INTO 부품사용차량정보 VALUES ('134', '89247', '아반떼', '현대');
INSERT INTO 부품사용차량정보 VALUES ('135', '63058', '투싼', '현대');
INSERT INTO 부품사용차량정보 VALUES ('136', '17429', '팰리세이드', '현대');
INSERT INTO 부품사용차량정보 VALUES ('137', '86430', '카니발', '기아');
INSERT INTO 부품사용차량정보 VALUES ('138', '21984', '쏘나타', '현대');
INSERT INTO 부품사용차량정보 VALUES ('139', '37486', '쏘렌토', '현대');
INSERT INTO 부품사용차량정보 VALUES ('140', '92751', '투싼', '현대');
INSERT INTO 부품사용차량정보 VALUES ('141', '60932', 'K5', '기아');
INSERT INTO 부품사용차량정보 VALUES ('142', '78416', 'K3', '기아');
INSERT INTO 부품사용차량정보 VALUES ('143', '14587', '스포티지', '기아');
INSERT INTO 부품사용차량정보 VALUES ('144', '29378', '셀토스', '기아');
INSERT INTO 부품사용차량정보 VALUES ('145', '54029', '모하비', '기아');
INSERT INTO 부품사용차량정보 VALUES ('146', '32678', '아반떼', '현대');
INSERT INTO 부품사용차량정보 VALUES ('147', '91234', '투싼', '현대');
INSERT INTO 부품사용차량정보 VALUES ('148', '48329', '팰리세이드', '현대');
INSERT INTO 부품사용차량정보 VALUES ('149', '87543', '카니발', '기아');
INSERT INTO 부품사용차량정보 VALUES ('150', '64910', '쏘나타', '현대');
INSERT INTO 부품사용차량정보 VALUES ('151', '32095', '쏘렌토', '현대');
INSERT INTO 부품사용차량정보 VALUES ('152', '87654', '투싼', '현대');
INSERT INTO 부품사용차량정보 VALUES ('153', '54378', 'K5', '기아');
INSERT INTO 부품사용차량정보 VALUES ('154', '90672', 'K3', '기아');
INSERT INTO 부품사용차량정보 VALUES ('155', '41237', '스포티지', '기아');
INSERT INTO 부품사용차량정보 VALUES ('156', '15789', '셀토스', '기아');
INSERT INTO 부품사용차량정보 VALUES ('157', '68423', '모하비', '기아');
INSERT INTO 부품사용차량정보 VALUES ('158', '89752', '아반떼', '현대');
INSERT INTO 부품사용차량정보 VALUES ('159', '54219', '투싼', '현대');
INSERT INTO 부품사용차량정보 VALUES ('160', '42578', '팰리세이드', '현대');
INSERT INTO 부품사용차량정보 VALUES ('161', '93510', '카니발', '기아');
INSERT INTO 부품사용차량정보 VALUES ('162', '64809', '쏘나타', '현대');
INSERT INTO 부품사용차량정보 VALUES ('163', '57381', '쏘렌토', '현대');
INSERT INTO 부품사용차량정보 VALUES ('164', '23985', '투싼', '현대');
INSERT INTO 부품사용차량정보 VALUES ('165', '81624', 'K5', '기아');
INSERT INTO 부품사용차량정보 VALUES ('166', '49307', 'K3', '기아');
INSERT INTO 부품사용차량정보 VALUES ('167', '72518', '스포티지', '기아');
INSERT INTO 부품사용차량정보 VALUES ('168', '30697', '셀토스', '기아');
INSERT INTO 부품사용차량정보 VALUES ('169', '51274', '모하비', '기아');
INSERT INTO 부품사용차량정보 VALUES ('170', '26804', '아반떼', '현대');
INSERT INTO 부품사용차량정보 VALUES ('171', '82394', '투싼', '현대');
INSERT INTO 부품사용차량정보 VALUES ('172', '14082', '팰리세이드', '현대');
INSERT INTO 부품사용차량정보 VALUES ('173', '70654', '카니발', '기아');
INSERT INTO 부품사용차량정보 VALUES ('174', '58234', '쏘나타', '현대');
INSERT INTO 부품사용차량정보 VALUES ('175', '42037', '쏘렌토', '현대');
INSERT INTO 부품사용차량정보 VALUES ('176', '50891', '투싼', '현대');
INSERT INTO 부품사용차량정보 VALUES ('177', '96372', 'K5', '기아');
INSERT INTO 부품사용차량정보 VALUES ('178', '40196', 'K3', '기아');
INSERT INTO 부품사용차량정보 VALUES ('179', '57203', '스포티지', '기아');
INSERT INTO 부품사용차량정보 VALUES ('180', '93140', '셀토스', '기아');
INSERT INTO 부품사용차량정보 VALUES ('181', '49731', '모하비', '기아');
INSERT INTO 부품사용차량정보 VALUES ('182', '63108', '아반떼', '현대');
INSERT INTO 부품사용차량정보 VALUES ('183', '84032', '투싼', '현대');
INSERT INTO 부품사용차량정보 VALUES ('184', '56301', '팰리세이드', '현대');
INSERT INTO 부품사용차량정보 VALUES ('185', '17854', '카니발', '기아');
INSERT INTO 부품사용차량정보 VALUES ('186', '63527', '쏘나타', '현대');
INSERT INTO 부품사용차량정보 VALUES ('187', '78456', '쏘렌토', '현대');
INSERT INTO 부품사용차량정보 VALUES ('188', '32971', '투싼', '현대');
INSERT INTO 부품사용차량정보 VALUES ('189', '49082', 'K5', '기아');
INSERT INTO 부품사용차량정보 VALUES ('190', '69417', 'K3', '기아');
INSERT INTO 부품사용차량정보 VALUES ('191', '82054', '스포티지', '기아');
INSERT INTO 부품사용차량정보 VALUES ('192', '50912', '셀토스', '기아');
INSERT INTO 부품사용차량정보 VALUES ('193', '35879', '모하비', '기아');
INSERT INTO 부품사용차량정보 VALUES ('194', '46210', '아반떼', '현대');
INSERT INTO 부품사용차량정보 VALUES ('195', '93015', '투싼', '현대');
INSERT INTO 부품사용차량정보 VALUES ('196', '61740', '팰리세이드', '현대');
INSERT INTO 부품사용차량정보 VALUES ('197', '82493', '카니발', '기아');
INSERT INTO 부품사용차량정보 VALUES ('198', '17659', '쏘나타', '현대');
INSERT INTO 부품사용차량정보 VALUES ('199', '42968', '쏘렌토', '현대');
INSERT INTO 부품사용차량정보 VALUES ('200', '57341', '투싼', '현대');
INSERT INTO 부품사용차량정보 VALUES ('201', '24089', 'K5', '기아');
INSERT INTO 부품사용차량정보 VALUES ('202', '68510', 'K3', '기아');
INSERT INTO 부품사용차량정보 VALUES ('203', '25736', '스포티지', '기아');
INSERT INTO 부품사용차량정보 VALUES ('204', '89074', '셀토스', '기아');
INSERT INTO 부품사용차량정보 VALUES ('205', '16485', '모하비', '기아');
INSERT INTO 부품사용차량정보 VALUES ('206', '76829', '아반떼', '현대');
INSERT INTO 부품사용차량정보 VALUES ('207', '93027', '투싼', '현대');
INSERT INTO 부품사용차량정보 VALUES ('208', '46273', '팰리세이드', '현대');
INSERT INTO 부품사용차량정보 VALUES ('209', '59318', '카니발', '기아');
INSERT INTO 부품사용차량정보 VALUES ('210', '30756', '쏘나타', '현대');
INSERT INTO 부품사용차량정보 VALUES ('211', '85410', '쏘렌토', '현대');
INSERT INTO 부품사용차량정보 VALUES ('212', '72948', '투싼', '현대');
INSERT INTO 부품사용차량정보 VALUES ('213', '61428', 'K5', '기아');
INSERT INTO 부품사용차량정보 VALUES ('214', '87036', 'K3', '기아');
INSERT INTO 부품사용차량정보 VALUES ('215', '41562', '스포티지', '기아');
INSERT INTO 부품사용차량정보 VALUES ('216', '95213', '셀토스', '기아');
INSERT INTO 부품사용차량정보 VALUES ('217', '53819', '모하비', '기아');
INSERT INTO 부품사용차량정보 VALUES ('218', '37291', '아반떼', '현대');
INSERT INTO 부품사용차량정보 VALUES ('219', '42683', '투싼', '현대');
INSERT INTO 부품사용차량정보 VALUES ('220', '18390', '팰리세이드', '현대');
INSERT INTO 부품사용차량정보 VALUES ('221', '67412', '카니발', '기아');
INSERT INTO 부품사용차량정보 VALUES ('222', '31879', '쏘나타', '현대');
INSERT INTO 부품사용차량정보 VALUES ('223', '84920', '쏘렌토', '현대');
INSERT INTO 부품사용차량정보 VALUES ('224', '59613', '투싼', '현대');
INSERT INTO 부품사용차량정보 VALUES ('225', '70425', 'K5', '기아');
INSERT INTO 부품사용차량정보 VALUES ('226', '13582', 'K3', '기아');
INSERT INTO 부품사용차량정보 VALUES ('227', '92764', '스포티지', '기아');
INSERT INTO 부품사용차량정보 VALUES ('228', '50837', '셀토스', '기아');
INSERT INTO 부품사용차량정보 VALUES ('229', '34261', '모하비', '기아');
INSERT INTO 부품사용차량정보 VALUES ('230', '89123', '아반떼', '현대');
INSERT INTO 부품사용차량정보 VALUES ('231', '63972', '투싼', '현대');
INSERT INTO 부품사용차량정보 VALUES ('232', '42158', '팰리세이드', '현대');
INSERT INTO 부품사용차량정보 VALUES ('233', '86739', '카니발', '기아');
INSERT INTO 부품사용차량정보 VALUES ('234', '15698', '쏘나타', '현대');
INSERT INTO 부품사용차량정보 VALUES ('235', '78524', '쏘렌토', '현대');
INSERT INTO 부품사용차량정보 VALUES ('236', '90247', '투싼', '현대');
INSERT INTO 부품사용차량정보 VALUES ('237', '53694', 'K5', '기아');
INSERT INTO 부품사용차량정보 VALUES ('238', '21876', 'K3', '기아');
INSERT INTO 부품사용차량정보 VALUES ('239', '79351', '스포티지', '기아');
INSERT INTO 부품사용차량정보 VALUES ('240', '45812', '셀토스', '기아');
INSERT INTO 부품사용차량정보 VALUES ('241', '62487', '모하비', '기아');
INSERT INTO 부품사용차량정보 VALUES ('242', '57123', '아반떼', '현대');
INSERT INTO 부품사용차량정보 VALUES ('243', '43982', '투싼', '현대');
INSERT INTO 부품사용차량정보 VALUES ('244', '82016', '팰리세이드', '현대');
INSERT INTO 부품사용차량정보 VALUES ('245', '29571', '카니발', '기아');
INSERT INTO 부품사용차량정보 VALUES ('246', '64823', '쏘나타', '현대');
INSERT INTO 부품사용차량정보 VALUES ('247', '72356', '쏘렌토', '현대');
INSERT INTO 부품사용차량정보 VALUES ('248', '18745', '투싼', '현대');
INSERT INTO 부품사용차량정보 VALUES ('249', '97652', 'K5', '기아');
INSERT INTO 부품사용차량정보 VALUES ('250', '53294', 'K3', '기아');
INSERT INTO 부품사용차량정보 VALUES ('251', '45738', '스포티지', '기아');
INSERT INTO 부품사용차량정보 VALUES ('252', '69301', '셀토스', '기아');
INSERT INTO 부품사용차량정보 VALUES ('253', '87416', '모하비', '기아');
INSERT INTO 부품사용차량정보 VALUES ('254', '43078', '아반떼', '현대');
INSERT INTO 부품사용차량정보 VALUES ('255', '62917', '투싼', '현대');
INSERT INTO 부품사용차량정보 VALUES ('256', '18473', '팰리세이드', '현대');
INSERT INTO 부품사용차량정보 VALUES ('257', '96521', '카니발', '기아');
INSERT INTO 부품사용차량정보 VALUES ('258', '37204', '쏘나타', '현대');
INSERT INTO 부품사용차량정보 VALUES ('259', '85026', '쏘렌토', '현대');
INSERT INTO 부품사용차량정보 VALUES ('260', '51793', '투싼', '현대');
INSERT INTO 부품사용차량정보 VALUES ('261', '79234', 'K5', '기아');
INSERT INTO 부품사용차량정보 VALUES ('262', '40195', 'K3', '기아');
INSERT INTO 부품사용차량정보 VALUES ('263', '57284', '스포티지', '기아');
INSERT INTO 부품사용차량정보 VALUES ('264', '93106', '셀토스', '기아');
INSERT INTO 부품사용차량정보 VALUES ('265', '49753', '모하비', '기아');
INSERT INTO 부품사용차량정보 VALUES ('266', '63089', '아반떼', '현대');
INSERT INTO 부품사용차량정보 VALUES ('267', '74058', '투싼', '현대');
INSERT INTO 부품사용차량정보 VALUES ('268', '61027', '팰리세이드', '현대');
INSERT INTO 부품사용차량정보 VALUES ('269', '51348', '카니발', '기아');
INSERT INTO 부품사용차량정보 VALUES ('270', '76902', '쏘나타', '현대');
INSERT INTO 부품사용차량정보 VALUES ('271', '85493', '쏘렌토', '현대');
INSERT INTO 부품사용차량정보 VALUES ('272', '42761', '투싼', '현대');
INSERT INTO 부품사용차량정보 VALUES ('273', '93816', 'K5', '기아');
INSERT INTO 부품사용차량정보 VALUES ('274', '59234', 'K3', '기아');
INSERT INTO 부품사용차량정보 VALUES ('275', '18539', '스포티지', '기아');
INSERT INTO 부품사용차량정보 VALUES ('276', '67428', '셀토스', '기아');
INSERT INTO 부품사용차량정보 VALUES ('277', '52014', '모하비', '기아');
INSERT INTO 부품사용차량정보 VALUES ('278', '69385', '아반떼', '현대');
INSERT INTO 부품사용차량정보 VALUES ('279', '74095', '투싼', '현대');
INSERT INTO 부품사용차량정보 VALUES ('280', '20567', '팰리세이드', '현대');
INSERT INTO 부품사용차량정보 VALUES ('281', '95017', '카니발', '기아');
INSERT INTO 부품사용차량정보 VALUES ('282', '41623', '쏘나타', '현대');
INSERT INTO 부품사용차량정보 VALUES ('283', '53794', '쏘렌토', '현대');
INSERT INTO 부품사용차량정보 VALUES ('284', '28906', '투싼', '현대');
INSERT INTO 부품사용차량정보 VALUES ('285', '62045', 'K5', '기아');
INSERT INTO 부품사용차량정보 VALUES ('286', '87026', 'K3', '기아');
INSERT INTO 부품사용차량정보 VALUES ('287', '40512', '스포티지', '기아');
INSERT INTO 부품사용차량정보 VALUES ('288', '32165', '셀토스', '기아');
INSERT INTO 부품사용차량정보 VALUES ('289', '95420', '모하비', '기아');
INSERT INTO 부품사용차량정보 VALUES ('290', '73096', '아반떼', '현대');
INSERT INTO 부품사용차량정보 VALUES ('291', '64328', '투싼', '현대');
INSERT INTO 부품사용차량정보 VALUES ('292', '18935', '팰리세이드', '현대');
INSERT INTO 부품사용차량정보 VALUES ('293', '87541', '카니발', '기아');
INSERT INTO 부품사용차량정보 VALUES ('294', '54910', '쏘나타', '현대');
INSERT INTO 부품사용차량정보 VALUES ('295', '18754', '쏘렌토', '현대');
INSERT INTO 부품사용차량정보 VALUES ('296', '92035', '투싼', '현대');
INSERT INTO 부품사용차량정보 VALUES ('297', '67123', 'K5', '기아');
INSERT INTO 부품사용차량정보 VALUES ('298', '38502', 'K3', '기아');
INSERT INTO 부품사용차량정보 VALUES ('299', '50672', '스포티지', '기아');




-- 예제

-- 보유차량정보 테이블에서 회원ID가 1인 데이터의 보유차량모델명과 보유차량제조사를 검색
SELECT 보유차량모델명, 보유차량제조사
FROM 보유차량정보
WHERE 회원ID = 1;

-- 부품정보 테이블과 부품재고 테이블을 INNER JOIN 하여 부품재고가 15 이하인 데이터의 부품명과 부품재고를 검색
SELECT 부품명, 부품재고
FROM 부품정보
JOIN 부품재고 ON 부품정보.부품번호 = 부품재고.부품번호
WHERE 부품재고 <= 15;
 
 -- 부품정보 테이블에서 부품명이 '센서'가 들어가고 부품제조사가 현대모비스인 데이터를 전체검색 
SELECT *
FROM 부품정보
WHERE 부품명 LIKE '%센서%'
  AND 부품제조사 = '현대모비스';

-- 부품정보 테이블과 부품재고 테이블을 INNER JOIN하여 부품명과 부품재고를 검색하여 부품재고를 내림차순으로 정렬
SELECT 부품명, 부품재고
FROM 부품정보 INNER JOIN 부품재고
ON 부품정보.부품번호 = 부품재고.부품번호
ORDER BY 부품재고 DESC;

-- 회원정보 테이블에서 주소의 왼쪽에서 4번째 문자까지만 기준으로 테이블 전체의 수를 회원수로 이름변경해서 검색  
SELECT LEFT(주소, 4) AS 지역, COUNT(*) AS 회원수
FROM 회원정보
GROUP BY LEFT(주소, 4);

-- 구매이력 테이블과 부품정보 테이블을 INNER JOIN하여 부품정보 테이블의 부품명을 기준으로 부품명 검색, 구매이력과 구매갯수의 합을 총구매수량으로 이름변경해서 검색, 부품명을 오름차순 정렬
SELECT 부품정보.부품명, SUM(구매이력.구매갯수) AS 총구매수량
FROM 구매이력
JOIN 부품정보 ON 구매이력.부품번호 = 부품정보.부품번호
GROUP BY 부품정보.부품명
ORDER BY 부품명;

-- 부품사용차량정보 테이블과 부품정보 테이블을 INNER JOIN하여 부품사용차량정보 테이블의 차량모델명이 셀토스인 데이터의 부품명과 부품제조사를 검색
SELECT 부품정보.부품명, 부품정보.부품제조사
FROM 부품사용차량정보
JOIN 부품정보 ON 부품사용차량정보.부품번호 = 부품정보.부품번호
WHERE 부품사용차량정보.차량모델명 = '셀토스';

-- 차량수리이력 테이블에서 차대번호, 수리일(출고일로 이름변경), 수리내역을 검색하여 한개까지만 수리일을 내림차순으로 정렬하여 검색
SELECT 차대번호, 수리일 AS 출고일, 수리내역
FROM 차량수리이력
ORDER BY 수리일 DESC
LIMIT 1;

-- 부품정보 테이블과 부품재고 테이블을 INNER JOIN하여 가격이 20000보다 큰 부품의 부품 중 재고수가 최대인 데이터의 부품종류, 부품명, 부품제조사, 가격, 부품재고수를 검색
SELECT 부품종류, 부품명, 부품제조사, 가격, 부품재고수
FROM 부품정보 INNER JOIN 부품재고
    ON 부품정보.부품번호 = 부품재고.부품번호
WHERE 부품재고수 = (
    SELECT MAX(부품재고수)
    FROM 부품재고
    WHERE 가격 > 20000
);

-- 부품정보 테이블에서 부품제조사 컬럼을 중복을 제거해서 검색
SELECT DISTINCT 부품제조사
FROM 부품정보;

-- 구매이력 테이블에서 구매일이 20240101 과 20240601 사이인 데이터의 회원ID와 부품번호, 구매일을 검색
SELECT 회원ID, 부품번호, 구매일
FROM 구매이력
WHERE 구매일 BETWEEN '20240101' AND '20240601';

-- 부품보유점구분테이블에서 계열이 자동차 대리점이고 보유점주소가 '서울'이 들어가 있거나 '부산'이 들어가 있는 데이터의 상호와 보유점주소를 검색
SELECT 상호, 보유점주소
FROM 부품보유점구분
WHERE 계열 = '자동차 대리점'
  AND (보유점주소 LIKE '%서울%' OR 보유점주소 LIKE '%부산%');
  
-- 부품정보 테이블에서 부품번호가 225인 데이터의 가격을 60000으로 갱신
UPDATE 부품정보
SET 가격 = 60000
WHERE 부품번호 = 225;

-- 부품정보 테이블에서 부품번호가 225인 데이터를 삭제
DELETE FROM 부품정보
WHERE 부품번호 = 225;

-- 부품보유점정보 테이블에서 보유점코드가 3인 데이터를 삭제
DELETE FROM 부품보유점정보
WHERE 보유점코드 = 3;

-- 회원정보 테이블에 생년월일 컬럼을 DATE 형식으로 추가
ALTER TABLE 회원정보
ADD COLUMN 생년월일 DATE;

-- 회원정보 테이블을 전체검색
SELECT *
FROM 회원정보;

-- bupum 데이터베이스를 삭제
DROP DATABASE bupum;

-- 부품정보 테이블에서 부품제조사를 기준으로 하여 평균 가격이 100000 보다 큰 데이터의 부품제조사, 평균가격을 검색
SELECT 부품제조사, AVG(가격) AS 평균가격
FROM 부품정보
GROUP BY 부품제조사
HAVING AVG(가격) > 100000;

-- 구매이력 테이블을 전체검색
SELECT * 
FROM 구매이력;