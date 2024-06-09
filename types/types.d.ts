interface Motivation {
    id: number;
    quote: string;
  }

  interface Invoice {
    title: string;
    description: string;
    questions: Question[];
    answers: Answer[];
  }
  
  interface Question {
    id: number;
    question: string;
    answer_id: number;
    image: string;
  }
  
  interface Answer {
    id: number;
    answer: string;
  }

  interface AnswerTest {
    id: number;
    answer: string;
    correct: boolean;
  }
  
  interface Question {
    id: number;
    title: string;
    question: string;
    answers: AnswerTest[];
    selectedAnswer?: AnswerTest; // Optional because it will be selected during the quiz
  }
  
  // Rename specific interfaces to a more generic name to reuse in different quizzes
  type SocialInsurance = Question;
  type InvoiceTest = Question;
  type BelgianJournal = Question;
  
