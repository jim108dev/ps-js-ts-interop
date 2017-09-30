import * as OutputPeople from "../output/People";

type Person = {
  name: string;
};

type PeopleModule = {
  david: Person
}

const People: PeopleModule = OutputPeople

console.log(People.david);
