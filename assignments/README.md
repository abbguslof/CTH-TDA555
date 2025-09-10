# Assignments – Labs & Solutions

**English | Svenska**

---

## Overview | Översikt

This folder contains our group’s solutions for the course labs (assignments) in TDA555. Each subfolder is a separate lab with its own README and instructions.

Denna mapp innehåller vår grupps lösningar för kursens laborationer (uppgifter) i TDA555. Varje undermapp är en separat labb med egen README och instruktioner.

---

## Lab Instructions | Laborationsinstruktioner

- You are required to work in groups of 3, which you may create on your own. If you have any trouble you could use the #find-lab-partner channel on the Discord server to find a group.

### Testing

- Before you submit your solution, you must make sure that all tests pass. To do this, open a terminal in the lab folder and run: `make test`. This will compile your code and execute the entire test suite.
- You must also generate a test report by running: `make report`. This command will create a text file (e.g. `test_report.txt`) containing the results of all tests.
- When you submit, include both your Haskell source files and the generated test report. Your submission is complete only if all tests pass and the report is included.

### Lab Submission

- All labs must be submitted online via Canvas.
- Each lab has two deadlines: a first deadline and a final deadline. See details about the deadlines below.
- You must test your code. Every lab is accompanied with a test suite. Your solution should pass all tests before you submit the code.
- For Labs 2 and 3, after completing the final part, you must also present and explain your solution to a teaching assistant. See the detailed instructions below for more information.
- You are not allowed to change the type signatures of the functions given in the lab description and skeleton code, unless stated otherwise.
- Some labs have extra assignments. These are for your own pleasure; there are no bonus points awarded.
- Before you submit your code, spend some time cleaning up your code; make it simpler, remove unnecessary things, etc. We will reject your solution if it is not clean.

#### Clean Code Checklist
- No long lines (< 90 characters)
- Consistent layout (do not use TAB characters)
- Type signatures for all top-level functions you are asked to write
- Good comments (preferably not over 80 characters)
- No junk (unused code, commented code, unnecessary comments)
- No overly complicated function definitions
- No repetitive code (copy-and-paste programming)
- Names and group number listed in your source files
- Use `hlint` for style suggestions (ignore advanced suggestions if not covered in lectures)

### Presentation of Solutions

- When you have completed all parts of Labs 2 and 3, you must present your solution to your supervisor.
- Dedicated presentation sessions are scheduled after the deadlines for the final parts of Lab 2 and Lab 3 (weeks 39 and 42). See TimeEdit for exact times.
- You may also present during normal lab sessions, but groups with questions are prioritized.
- All group members must be present and able to explain the entire submitted code. If a group member cannot explain the code, they will need to present again.
- Use the #queue channel for sign-up: post your name and location, and a TA will come to you when it is your turn.

### Deadlines

- Each lab has a first and final deadline. A teaching assistant will review your work, provide feedback, and grade your submission. Failure to meet the final deadline with an accepted solution may result in failing the lab component of the course.

**First deadline:**
- Submit your complete solution.
- Must be a serious attempt.
- If there are problems, you will get feedback so you can revise and resubmit.

**Final deadline (~1.5 week after first submission):**
- You can submit several times before the final deadline, but you should have addressed all remarks.
- The final, correct solution must be submitted and presented before the final deadline.
- No submissions are accepted after the deadline. If you need an extension, contact the course team before the deadline.

### Code of Honor

- Working on the assignments and developing your own (group) solutions is an important part of the learning process.
- You may discuss assignments and solutions with other students outside your group, and use the web forum for questions, but don't share your solutions or parts of solutions directly.
- You may (and are supposed to!) work together with your group members.

**Cheating is unacceptable. Cheating means:**
- Using someone else's code
- Showing your code to someone else (copying, emailing, printing, pen-and-paper writing)
- Copying code from the web
- Using generative AI to generate code, unless explicitly allowed
- etc.

If you have problems, talk to the course team instead of copying from others. You may get more time and help. If this is not enough, it is advisable to redo the course next year rather than cheat.

Cheating can be detected by graders and automatic software. If suspected:
- The case is reported to the disciplinary board (Chalmers or GU)
- You might be suspended ("avstängd") 1-3 months (no studiemedel)
- You might be expelled

### Use of External Libraries

- Only use external modules mentioned in the lab descriptions:
  - Data.Char
  - Data.List
  - Data.Maybe
  - Test.QuickCheck
- You are encouraged to experiment with external libraries after solving the assignments, but graders may not have those libraries installed, so don't use non-standard modules in submitted files.

---

## Disclaimer | Ansvarsfriskrivning

These solutions are provided for reference and inspiration only. They are not guaranteed to be 100% correct or perfect. Use them to learn, compare, and discuss—but do not copy or submit them as your own work!

Dessa lösningar är endast för referens och inspiration. De är inte garanterat 100% korrekta eller perfekta. Använd dem för att lära dig, jämföra och diskutera—men kopiera eller lämna inte in dem som ditt eget arbete!

### Plagiarism Warning | Varning för plagiat

> Submitting these solutions as your own is plagiarism and may result in disciplinary action. Always write your own code and use these files responsibly.

> Att lämna in dessa lösningar som ditt eget är plagiat och kan leda till disciplinära åtgärder. Skriv alltid din egen kod och använd dessa filer ansvarsfullt.

---

## Motivation | Motivation

> "Learn from others, but always make the work your own!"
> "Lär dig av andra, men gör alltid arbetet till ditt eget!"

---

## Structure | Struktur

- `lab1_power_to_the_people/` – Lab 1: Recursion & Performance
- `lab2_blackjack_part_a/` – Lab 2: Blackjack Game

Each lab contains:
- Solutions (`.hs` files)
- Instructions (`instructions.md`)
- README (bilingual)
- Makefile for building/testing

Varje labb innehåller:
- Lösningar (`.hs`-filer)
- Instruktioner (`instructions.md`)
- README (tvåspråkig)
- Makefile för bygg/test

---

## License

BSD
