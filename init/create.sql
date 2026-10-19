CREATE TABLE Dim_Person (
    id          BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    firstname   VARCHAR(100),
    name        VARCHAR(100) NOT NULL,
    nationality VARCHAR(100),
    position    VARCHAR(50),
    borndate    DATE
);

CREATE TABLE Dim_Club (
    id      BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name    VARCHAR(150) NOT NULL,
    country VARCHAR(100),
    league  VARCHAR(150)
);

CREATE TABLE Dim_Game (
    id         BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    result     VARCHAR(50),
    avancement VARCHAR(100),
    stakes     VARCHAR(100)
);

CREATE TABLE Dim_Competition (
    id       BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name     VARCHAR(150) NOT NULL,
    prestige INT,
    scope    VARCHAR(100),
    format   VARCHAR(100)
);

CREATE TABLE Dim_Media (
    id   BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    type VARCHAR(50)
);

CREATE TABLE Dim_Date (
    id    BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    day   INT NOT NULL CHECK (day BETWEEN 1 AND 31),
    month INT NOT NULL CHECK (month BETWEEN 1 AND 12),
    year  INT NOT NULL,
    CONSTRAINT uq_dim_date UNIQUE (year, month, day)
);


CREATE TABLE Fact_Declaration (
    id                          BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    total_words                 INT,
    cliches_words               INT,
    distinct_cliche_expressions INT,
    total_expressions           INT,
    banality_index              DOUBLE PRECISION,
    type                        VARCHAR(50),

    person_id      BIGINT,
    club_id        BIGINT,
    game_id        BIGINT,
    competition_id BIGINT,
    media_id       BIGINT,
    date_id        BIGINT,

    CONSTRAINT fk_fact_person      FOREIGN KEY (person_id)      REFERENCES Dim_Person(id),
    CONSTRAINT fk_fact_club        FOREIGN KEY (club_id)        REFERENCES Dim_Club(id),
    CONSTRAINT fk_fact_game        FOREIGN KEY (game_id)        REFERENCES Dim_Game(id),
    CONSTRAINT fk_fact_competition FOREIGN KEY (competition_id) REFERENCES Dim_Competition(id),
    CONSTRAINT fk_fact_media       FOREIGN KEY (media_id)       REFERENCES Dim_Media(id),
    CONSTRAINT fk_fact_date        FOREIGN KEY (date_id)        REFERENCES Dim_Date(id)
);

CREATE INDEX idx_fact_person      ON Fact_Declaration(person_id);
CREATE INDEX idx_fact_club        ON Fact_Declaration(club_id);
CREATE INDEX idx_fact_game        ON Fact_Declaration(game_id);
CREATE INDEX idx_fact_competition ON Fact_Declaration(competition_id);
CREATE INDEX idx_fact_media       ON Fact_Declaration(media_id);
CREATE INDEX idx_fact_date        ON Fact_Declaration(date_id);
