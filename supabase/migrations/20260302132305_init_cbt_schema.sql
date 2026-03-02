-- =========================
-- 1. ENUMS
-- =========================

CREATE TYPE user_role AS ENUM ('admin', 'teacher', 'student');


-- =========================
-- 2. PROFILES (Linked to Supabase auth.users)
-- =========================

CREATE TABLE public.profiles (
    id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
    role user_role NOT NULL,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT now() NOT NULL,
    updated_at TIMESTAMPTZ DEFAULT now() NOT NULL
);

CREATE INDEX idx_profiles_role ON public.profiles(role);


-- =========================
-- 3. CLASSES
-- =========================

CREATE TABLE public.classes (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    name TEXT UNIQUE NOT NULL,
    created_at TIMESTAMPTZ DEFAULT now() NOT NULL
);


-- =========================
-- 4. STUDENTS
-- =========================

CREATE TABLE public.students (
    id UUID PRIMARY KEY REFERENCES public.profiles(id) ON DELETE CASCADE,
    admission_number TEXT UNIQUE NOT NULL,
    class_id UUID REFERENCES public.classes(id) ON DELETE RESTRICT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    created_at TIMESTAMPTZ DEFAULT now() NOT NULL
);

CREATE INDEX idx_students_class ON public.students(class_id);


-- =========================
-- 5. TEACHERS
-- =========================

CREATE TABLE public.teachers (
    id UUID PRIMARY KEY REFERENCES public.profiles(id) ON DELETE CASCADE,
    email TEXT UNIQUE NOT NULL,
    created_at TIMESTAMPTZ DEFAULT now() NOT NULL
);


-- =========================
-- 6. SUBJECTS (Per Class)
-- =========================

CREATE TABLE public.subjects (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    name TEXT NOT NULL,
    class_id UUID REFERENCES public.classes(id) ON DELETE CASCADE NOT NULL,
    UNIQUE(name, class_id)
);

CREATE INDEX idx_subjects_class ON public.subjects(class_id);


-- =========================
-- 7. TEACHER ↔ SUBJECT RELATION
-- =========================

CREATE TABLE public.teacher_subjects (
    teacher_id UUID REFERENCES public.teachers(id) ON DELETE CASCADE,
    subject_id UUID REFERENCES public.subjects(id) ON DELETE CASCADE,
    PRIMARY KEY (teacher_id, subject_id)
);


-- =========================
-- 8. EXAMS
-- =========================

CREATE TABLE public.exams (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    subject_id UUID REFERENCES public.subjects(id) ON DELETE CASCADE NOT NULL,
    created_by UUID REFERENCES public.teachers(id) ON DELETE SET NULL,
    title TEXT NOT NULL,
    duration_minutes INTEGER NOT NULL CHECK (duration_minutes > 0),
    is_active BOOLEAN DEFAULT false,
    created_at TIMESTAMPTZ DEFAULT now() NOT NULL
);

CREATE INDEX idx_exams_subject ON public.exams(subject_id);


-- =========================
-- 9. QUESTIONS
-- =========================

CREATE TABLE public.questions (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    exam_id UUID REFERENCES public.exams(id) ON DELETE CASCADE NOT NULL,
    question_text TEXT NOT NULL,
    points INTEGER DEFAULT 1 CHECK (points > 0) NOT NULL
);

CREATE INDEX idx_questions_exam ON public.questions(exam_id);


-- =========================
-- 10. OPTIONS
-- =========================

CREATE TABLE public.options (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    question_id UUID REFERENCES public.questions(id) ON DELETE CASCADE NOT NULL,
    option_text TEXT NOT NULL,
    is_correct BOOLEAN NOT NULL
);

CREATE INDEX idx_options_question ON public.options(question_id);


-- =========================
-- 11. EXAM ATTEMPTS
-- =========================

CREATE TABLE public.exam_attempts (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    exam_id UUID REFERENCES public.exams(id) ON DELETE CASCADE NOT NULL,
    student_id UUID REFERENCES public.students(id) ON DELETE CASCADE NOT NULL,
    admission_number_snapshot TEXT NOT NULL,
    started_at TIMESTAMPTZ DEFAULT now() NOT NULL,
    completed_at TIMESTAMPTZ,
    total_score INTEGER,
    UNIQUE(exam_id, student_id)
);

CREATE INDEX idx_attempts_exam ON public.exam_attempts(exam_id);
CREATE INDEX idx_attempts_student ON public.exam_attempts(student_id);


-- =========================
-- 12. STUDENT ANSWERS
-- =========================

CREATE TABLE public.student_answers (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    attempt_id UUID REFERENCES public.exam_attempts(id) ON DELETE CASCADE NOT NULL,
    question_id UUID REFERENCES public.questions(id) ON DELETE CASCADE NOT NULL,
    selected_option_id UUID REFERENCES public.options(id),
    UNIQUE(attempt_id, question_id)
);

CREATE INDEX idx_answers_attempt ON public.student_answers(attempt_id);