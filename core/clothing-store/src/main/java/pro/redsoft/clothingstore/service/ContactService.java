package pro.redsoft.clothingstore.service;

import com.google.common.collect.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import pro.redsoft.clothingstore.domain.Contact;
import pro.redsoft.clothingstore.repository.ContactRepository;

import java.util.List;

/**
 * @author Alexander Novik
 *         Date: 28.11.13
 */

@Repository("contactService")
@Transactional
public class ContactService implements IContactService {

    @Autowired
    private ContactRepository contactRepository;

    @Override
    @Transactional(readOnly = true)
    public List<Contact> findAll() {
        return Lists.newArrayList(contactRepository.findAll());
    }

    @Override
    @Transactional(readOnly = true)
    public Contact findById(Integer id) {
        return contactRepository.findOne(id);
    }

    @Override
    public void delete(Integer id) {
        contactRepository.delete(id);
    }

    @Override
    public Contact save(Contact contact) {
        return contactRepository.save(contact);
    }
}
