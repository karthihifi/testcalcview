// namespace my.bookshop;

context my.bookshop {
  entity Books {
    key ID          : Integer;
        title       : String;
        translation : Association to one BookTexts
                        on translation.ID = $self.ID;
        stock       : Integer;
        authors     : Association to many booksToAuthors
                        on authors.book = $self;
  }

  entity BookTexts {
    key ID    : Integer;
        title : localized String
  }

  entity Authors {
    key ID    : Integer;
        name  : String;
        email : String;
        books : Association to many booksToAuthors
                  on books.author = $self;
  }

  @assert.unique: {key: [
    book,
    author
  ]}
  entity booksToAuthors {
    object : String;
    book   : Association to Books;
    author : Association to Authors;
  }

  view testView(IP_EMAIL : String, IP_LANG : String) as
    select from CV_TESTBOOKCOUNT (
      IP_EMAIL: :IP_EMAIL, IP_LANG: :IP_LANG
    ) {
      NAME,
      EMAIL,
      BOOK_ID,
      BOOKCOUNT
    }

//   view testView as
//     select from CV_TESTBOOKCOUNT {
//       NAME,
//       EMAIL,
//       BOOK_ID,
//       BOOKCOUNT,
//       Book : Association to one BookTexts on Book.ID = $self.BOOK_ID
//     }
}

// @cds.persistence.exists
// @cds.persistence.calcview
// entity V_AUTHORS {
//   key ID      : Integer;
//       NAME    : String;
//       EMAIL   : String;
//       BOOK_ID : Integer;
// };

// @cds.persistence.exists
// @cds.persistence.calcview
// entity V_TESTCOUNTER {
//   NAME    : String;
//   EMAIL   : String;
//   CC_1    : Integer;
//   COUNT_1 : Integer64
// };

///////////////////////////////////////////////////
@cds.persistence.exists
@cds.persistence.calcview
entity CV_TESTBOOKCOUNT(IP_EMAIL : String, IP_LANG : String default $user.locale) {
  NAME      : String;
  EMAIL     : String;
  BOOK_ID   : Integer;
  TITLE     : String;
  LOCALE    : String;
  BOOKCOUNT : Integer;
};

// @cds.persistence.exists
// @cds.persistence.calcview
// entity CV_TESTBOOKCOUNT {
//   NAME      : String;
//   EMAIL     : String;
//   BOOK_ID   : Integer;
//   BOOKCOUNT : Integer;
// };
