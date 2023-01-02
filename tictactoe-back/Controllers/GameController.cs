using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

using tictactoe_back.Services;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace tictactoe_back.Controllers
{
    [Route("api/[controller]")]
    public class GameController : Controller
    {
        private GameService gameService;

        public GameController(GameService gameService)
        {
            this.gameService = gameService;
        }

        // GET api/values/5
        [HttpGet("{id}")]
        public string[] Get(string id)
        {
            return this.gameService.getState(id);
        }

        // POST api/values
        [HttpPost("{id}")]
        public string[] Post(string id)
        {
            return this.gameService.initSession(id);
        }

        // PUT api/values/5
        [HttpPut("{id}")]
        public string[] Put(string id, [FromBody]string value)
        {
            return this.gameService.doMove(id);
        }

        // DELETE api/values/5
        [HttpDelete("{id}")]
        public void Delete(string id)
        {
            this.gameService.stopSession(id);
        }
    }
}

