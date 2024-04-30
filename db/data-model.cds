// namespace my.bookshop;

context my.bookshop {
  entity Books {
    key ID      : Integer;
        title   : String;
        stock   : Integer;
        authors : Association to many booksToAuthors
                    on authors.book = $self;
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
}

@cds.persistence.exists
@cds.persistence.calcview
entity V_AUTHORS {
  key ID      : Integer;
      NAME    : String;
      EMAIL   : String;
      BOOK_ID : Integer;
};

@cds.persistence.exists
@cds.persistence.calcview
entity V_TESTCOUNTER {
  NAME    : String;
  EMAIL   : String;
  CC_1    : Integer;
  COUNT_1 : Integer64
};
