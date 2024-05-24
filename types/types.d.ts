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