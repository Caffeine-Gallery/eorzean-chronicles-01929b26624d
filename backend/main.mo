import Int "mo:base/Int";
import Nat "mo:base/Nat";

import Array "mo:base/Array";
import Debug "mo:base/Debug";
import Text "mo:base/Text";
import Time "mo:base/Time";

actor {
  type BlogPost = {
    id: Nat;
    title: Text;
    content: Text;
    timestamp: Int;
  };

  type Job = {
    name: Text;
    role: Text;
    description: Text;
  };

  stable var posts : [BlogPost] = [];
  stable var nextId : Nat = 0;

  public func createPost(title: Text, content: Text) : async Nat {
    let id = nextId;
    let timestamp = Time.now();
    let post : BlogPost = {
      id;
      title;
      content;
      timestamp;
    };
    posts := Array.append(posts, [post]);
    nextId += 1;
    id
  };

  public query func getPosts() : async [BlogPost] {
    posts
  };

  public query func getJobs() : async [Job] {
    [
      { name = "Paladin"; role = "Tank"; description = "A holy knight who protects allies with a shield and sword." },
      { name = "Warrior"; role = "Tank"; description = "A berserker who uses rage to bolster defenses and crush enemies." },
      { name = "Dark Knight"; role = "Tank"; description = "A knight who channels darkness to protect allies and punish foes." },
      { name = "Gunbreaker"; role = "Tank"; description = "A defender who uses a gunblade to create powerful barriers." },
      { name = "White Mage"; role = "Healer"; description = "A conjurer who uses nature's power to heal and protect." },
      { name = "Scholar"; role = "Healer"; description = "A tactician who uses fairies and barriers to support allies." },
      { name = "Astrologian"; role = "Healer"; description = "A diviner who uses star power to heal and enhance party members." },
      { name = "Sage"; role = "Healer"; description = "A scholar who uses nouliths to heal and shield allies." },
      { name = "Monk"; role = "Melee DPS"; description = "A martial artist who chains powerful attacks in rapid succession." },
      { name = "Dragoon"; role = "Melee DPS"; description = "A lancer who performs acrobatic jumps to pierce enemies." },
      { name = "Ninja"; role = "Melee DPS"; description = "A shadowy warrior who uses ninjutsu to trick and defeat foes." },
      { name = "Samurai"; role = "Melee DPS"; description = "A swordmaster who uses carefully timed attacks for massive damage." },
      { name = "Reaper"; role = "Melee DPS"; description = "A sinister warrior who channels void energies to reap souls." },
      { name = "Bard"; role = "Ranged DPS"; description = "An archer who uses songs to inspire allies and damage enemies." },
      { name = "Machinist"; role = "Ranged DPS"; description = "An engineer who deploys turrets and uses magitek weaponry." },
      { name = "Dancer"; role = "Ranged DPS"; description = "A performer who uses dances to enhance allies and confuse enemies." },
      { name = "Black Mage"; role = "Magic DPS"; description = "A sorcerer who wields destructive fire, ice, and lightning magic." },
      { name = "Summoner"; role = "Magic DPS"; description = "A mage who summons powerful primals to fight alongside them." },
      { name = "Red Mage"; role = "Magic DPS"; description = "A versatile spellcaster who balances white and black magic." },
      { name = "Blue Mage"; role = "Limited Job"; description = "A flexible mage who learns and uses enemy abilities." }
    ]
  };
}
