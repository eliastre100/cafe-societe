INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'schema_migrations', 'schema_migrations', 2, 'CREATE TABLE "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_schema_migrations_1', 'schema_migrations', 3, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'ar_internal_metadata', 'ar_internal_metadata', 4, 'CREATE TABLE "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_ar_internal_metadata_1', 'ar_internal_metadata', 5, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'users', 'users', 6, 'CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "first_name" varchar, "last_name" varchar, "email" varchar, "password_digest" varchar)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'sqlite_sequence', 'sqlite_sequence', 7, 'CREATE TABLE sqlite_sequence(name,seq)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'editions', 'editions', 8, 'CREATE TABLE "editions" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'quizzs', 'quizzs', 9, 'CREATE TABLE "quizzs" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "edition_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'index_quizzs_on_edition_id', 'quizzs', 10, 'CREATE INDEX "index_quizzs_on_edition_id" ON "quizzs" ("edition_id")');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'questions', 'questions', 11, 'CREATE TABLE "questions" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "content" varchar, "quizz_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'index_questions_on_quizz_id', 'questions', 12, 'CREATE INDEX "index_questions_on_quizz_id" ON "questions" ("quizz_id")');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'responses', 'responses', 13, 'CREATE TABLE "responses" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "value" varchar, "solution" boolean, "question_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'index_responses_on_question_id', 'responses', 14, 'CREATE INDEX "index_responses_on_question_id" ON "responses" ("question_id")');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'quizz_answers', 'quizz_answers', 15, 'CREATE TABLE "quizz_answers" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "quizz_id" integer, "user_id" integer, "score" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'index_quizz_answers_on_quizz_id', 'quizz_answers', 16, 'CREATE INDEX "index_quizz_answers_on_quizz_id" ON "quizz_answers" ("quizz_id")');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'index_quizz_answers_on_user_id', 'quizz_answers', 17, 'CREATE INDEX "index_quizz_answers_on_user_id" ON "quizz_answers" ("user_id")');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'answers', 'answers', 18, 'CREATE TABLE "answers" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "question_id" integer, "response_id" integer, "quizz_answer_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'index_answers_on_question_id', 'answers', 19, 'CREATE INDEX "index_answers_on_question_id" ON "answers" ("question_id")');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'index_answers_on_response_id', 'answers', 20, 'CREATE INDEX "index_answers_on_response_id" ON "answers" ("response_id")');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'index_answers_on_quizz_answer_id', 'answers', 21, 'CREATE INDEX "index_answers_on_quizz_answer_id" ON "answers" ("quizz_answer_id")');