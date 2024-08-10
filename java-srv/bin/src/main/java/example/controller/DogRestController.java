package example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import example.model.Dog;
import example.repository.DogRepository;

@RestController
public class DogRestController {

	@Autowired
	private DogRepository dogRepository;

	@RequestMapping(path="/dogs", method=RequestMethod.GET)
	public Iterable<Dog> getAllDogs(){
		return dogRepository.findAll();
	}
}
