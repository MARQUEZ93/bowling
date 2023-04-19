# Bowling Coding Exercise WeInfuse

## Prep
I created & ran a container w/ a Docker Image pointing @ a Ruby image w/ IRB. I mounted my current dir into the docker container: `docker run --rm -it --volume $PWD:/app dannyben/alpine-ruby ruby /app/console.rb`

I would re-load the test.rb file to see changes in IRB: `load test.rb`

Run the test function to see all true statements: `test`

## How I Solved This

Ran a docker container w/ IRB. I used a Ruby Image as WeInfuse is a Ruby shop (as well as my previous job)

I am not familiar with how bowling works, so I googled scoring rules etc.

I started by writing tests in my `test` function after I understood rules. 

I then wrote conditionals in the `running_score` function until all tests passed (I may have missed some edge cases)