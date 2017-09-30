import * as OutputPeople from "../output/People";

import * as Types from "../generated/Types"

type PeopleModule = {
  david: Types.Person
}

const People: PeopleModule = OutputPeople

console.log(People.david);
