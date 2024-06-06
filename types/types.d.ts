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

  interface InvoiceTest {
    [x: string]: AnswerTest;
    selectedAnswer: AnswerTest;
    selectedAnswer: AnswerTest;
    id: number;
    title: string;
    questions: string;
    answers: AnswerTest[];
  }

  interface AnswerTest {
    answer: string;
    correct: boolean;
  }

  interface SocialInsurance {
    [x: string]: AnswerTest;
    selectedAnswer: AnswerTest;
    selectedAnswer: AnswerTest;
    id: number;
    title: string;
    questions: string;
    answers: AnswerTest[];
  }

  interface BelgianJournal {
    [x: string]: AnswerTest;
    selectedAnswer: AnswerTest;
    selectedAnswer: AnswerTest;
    id: number;
    title: string;
    questions: string;
    answers: AnswerTest[];
  }
