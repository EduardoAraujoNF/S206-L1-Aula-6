package aula_inatel.poke_api;

import com.intuit.karate.junit5.Karate;

class PokeRunner {

  @Karate.Test
  Karate testUsers() {
    return Karate.run("poke_api").relativeTo(getClass());
  }
}
